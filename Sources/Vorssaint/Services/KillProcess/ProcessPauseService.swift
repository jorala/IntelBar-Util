// SPDX-License-Identifier: GPL-3.0-or-later
// Copyright (C) 2026 Vorssaint
// Pause and resume added in the IntelBar Util fork.

import AppKit
import Darwin
import Foundation

/// Pauses and resumes whole apps, the way AppHalt does. SIGSTOP freezes an app
/// together with every helper process it owns, so it stops using CPU and
/// battery; SIGCONT lets it carry on exactly where it was.
///
/// Nothing is ever signalled without checking its kernel start time first, so
/// a pid that was reused by another program since the row was drawn is left
/// alone. System-critical processes and this app itself are never paused.
final class ProcessPauseService: ObservableObject {
    static let shared = ProcessPauseService()

    /// One process of a paused app, identified by pid AND start time.
    struct Member: Equatable {
        let pid: pid_t
        let startedAt: UInt64
    }

    struct PausedApp: Identifiable, Equatable {
        /// The app's main process.
        let pid: pid_t
        let name: String
        /// The main process first, then every helper that was frozen with it.
        let members: [Member]

        var id: pid_t { pid }
    }

    @Published private(set) var pausedApps: [PausedApp] = []

    private let queue = DispatchQueue(label: "ProcessPauseService", qos: .userInitiated)
    private var terminationObserver: NSObjectProtocol?

    private init() {
        // A frozen app cannot wake itself up. If this app quits while others
        // are paused, wake them first so none stays frozen for good.
        terminationObserver = NotificationCenter.default.addObserver(
            forName: NSApplication.willTerminateNotification,
            object: nil,
            queue: nil
        ) { [weak self] _ in
            self?.resumeAllSynchronously()
        }
    }

    deinit {
        if let terminationObserver {
            NotificationCenter.default.removeObserver(terminationObserver)
        }
    }

    // MARK: - State

    var hasPausedApps: Bool { !pausedApps.isEmpty }

    func isPaused(pid: pid_t) -> Bool {
        pausedApps.contains { $0.pid == pid }
    }

    func canPause(_ entry: KillProcessEntry) -> Bool {
        !entry.isProtected && entry.startedAt != nil && !isPaused(pid: entry.pid)
    }

    // MARK: - Pause

    /// Freezes the app and its helpers. `completion` runs on the main thread
    /// with whether the app's main process was frozen.
    func pause(_ entry: KillProcessEntry, completion: ((Bool) -> Void)? = nil) {
        guard canPause(entry), let startedAt = entry.startedAt else {
            completion?(false)
            return
        }
        let pid = entry.pid
        let name = entry.name
        queue.async {
            let app = Self.freeze(pid: pid, name: name, startedAt: startedAt)
            DispatchQueue.main.async {
                if let app {
                    self.pausedApps.removeAll { $0.pid == app.pid }
                    self.pausedApps.append(app)
                }
                completion?(app != nil)
            }
        }
    }

    // MARK: - Resume

    func resume(pid: pid_t, completion: (() -> Void)? = nil) {
        guard let app = pausedApps.first(where: { $0.pid == pid }) else {
            completion?()
            return
        }
        queue.async {
            Self.thaw(app)
            DispatchQueue.main.async {
                self.pausedApps.removeAll { $0.pid == pid }
                completion?()
            }
        }
    }

    func resumeAll(completion: (() -> Void)? = nil) {
        let apps = pausedApps
        guard !apps.isEmpty else {
            completion?()
            return
        }
        queue.async {
            apps.forEach(Self.thaw)
            DispatchQueue.main.async {
                self.pausedApps.removeAll()
                completion?()
            }
        }
    }

    /// Drops paused apps whose main process is gone (quit or killed), so the
    /// list never shows an app that no longer exists.
    func prune() {
        let stillThere = pausedApps.filter {
            KillProcessService.startTime(for: $0.pid) == $0.members.first?.startedAt
        }
        if stillThere.count != pausedApps.count {
            pausedApps = stillThere
        }
    }

    /// Runs on the main thread while the app terminates, so it must not wait
    /// on the background queue.
    private func resumeAllSynchronously() {
        pausedApps.forEach(Self.thaw)
        pausedApps = []
    }

    // MARK: - Signals

    /// Stops the main process, then each helper. Returns nil, and leaves
    /// nothing frozen, when the main process could not be stopped (for
    /// instance one owned by another user).
    private static func freeze(pid: pid_t, name: String, startedAt: UInt64) -> PausedApp? {
        guard KillProcessService.startTime(for: pid) == startedAt,
              !KillProcessService.isProtected(pid: pid, name: name) else { return nil }

        var candidates = [Member(pid: pid, startedAt: startedAt)]
        for child in descendants(of: pid) where !KillProcessService.isProtected(pid: child) {
            if let childStart = KillProcessService.startTime(for: child) {
                candidates.append(Member(pid: child, startedAt: childStart))
            }
        }

        var stopped: [Member] = []
        for member in candidates {
            guard KillProcessService.startTime(for: member.pid) == member.startedAt else { continue }
            if Darwin.kill(member.pid, SIGSTOP) == 0 {
                stopped.append(member)
            }
        }
        guard stopped.first?.pid == pid else {
            stopped.forEach { _ = Darwin.kill($0.pid, SIGCONT) }
            return nil
        }
        return PausedApp(pid: pid, name: name, members: stopped)
    }

    private static func thaw(_ app: PausedApp) {
        for member in app.members {
            guard KillProcessService.startTime(for: member.pid) == member.startedAt else { continue }
            _ = Darwin.kill(member.pid, SIGCONT)
        }
    }

    private static func descendants(of pid: pid_t) -> [pid_t] {
        let listing = Shell.run("/bin/ps", ["-eo", "pid,ppid"])
        guard listing.status == 0 else { return [] }
        let parents: [(pid: pid_t, ppid: pid_t)] = listing.output
            .split(separator: "\n").dropFirst().compactMap { line in
                let columns = line.split(separator: " ", omittingEmptySubsequences: true)
                guard columns.count >= 2, let child = pid_t(columns[0]),
                      let parent = pid_t(columns[1]) else { return nil }
                return (child, parent)
            }
        return KillProcessSupport.descendants(of: pid, parents: parents)
    }
}
