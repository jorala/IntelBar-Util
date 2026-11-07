// SPDX-License-Identifier: GPL-3.0-or-later
// Copyright (C) 2026 Vorssaint
// Pause and resume added in the IntelBar Util fork.

import Foundation

/// Strings for pausing and resuming apps from the Kill Process page. Same
/// contract as the other FeatureStrings structs: memberwise init in
/// declaration order, one static per language, all in this file.
struct ProcessPauseStrings {
    let pauseButton: String
    let resumeButton: String
    /// Takes the number of paused apps (%d).
    let resumeAllFormat: String
    let pausedBadge: String
    let pauseHelp: String
}

extension FeatureStrings {
    static func processPause(_ language: AppLanguage) -> ProcessPauseStrings {
        switch language {
        case .enUS: return .enUS
        case .ptBR: return .ptBR
        case .tr: return .tr
        case .ru: return .ru
        case .es: return .es
        case .sk: return .sk
        case .de: return .de
        case .fr: return .fr
        case .it: return .it
        case .ja: return .ja
        case .ko: return .ko
        case .zhHans: return .zhHans
        case .zhTW: return .zhTW
        case .zhHK: return .zhHK
        case .uk: return .uk
        }
    }
}

extension ProcessPauseStrings {
    static let enUS = ProcessPauseStrings(
        pauseButton: "Pause",
        resumeButton: "Resume",
        resumeAllFormat: "Resume all (%d paused)",
        pausedBadge: "Paused",
        pauseHelp: "Freeze this app and its helper processes. It stops using CPU and battery until you resume it."
    )
    static let ptBR = ProcessPauseStrings(
        pauseButton: "Pausar",
        resumeButton: "Retomar",
        resumeAllFormat: "Retomar todos (%d pausados)",
        pausedBadge: "Pausado",
        pauseHelp: "Congela este app e seus processos auxiliares. Ele para de usar CPU e bateria até você retomá-lo."
    )
    static let tr = ProcessPauseStrings(
        pauseButton: "Duraklat",
        resumeButton: "Sürdür",
        resumeAllFormat: "Tümünü sürdür (%d duraklatıldı)",
        pausedBadge: "Duraklatıldı",
        pauseHelp: "Bu uygulamayı ve yardımcı işlemlerini dondurur. Siz sürdürene kadar işlemci ve pil kullanmaz."
    )
    static let ru = ProcessPauseStrings(
        pauseButton: "Приостановить",
        resumeButton: "Возобновить",
        resumeAllFormat: "Возобновить все (приостановлено: %d)",
        pausedBadge: "Приостановлено",
        pauseHelp: "Замораживает это приложение и его вспомогательные процессы. Пока вы его не возобновите, оно не использует процессор и батарею."
    )
    static let es = ProcessPauseStrings(
        pauseButton: "Pausar",
        resumeButton: "Reanudar",
        resumeAllFormat: "Reanudar todas (%d en pausa)",
        pausedBadge: "En pausa",
        pauseHelp: "Congela esta app y sus procesos auxiliares. No usa CPU ni batería hasta que la reanudes."
    )
    static let sk = ProcessPauseStrings(
        pauseButton: "Pozastaviť",
        resumeButton: "Obnoviť",
        resumeAllFormat: "Obnoviť všetky (pozastavených: %d)",
        pausedBadge: "Pozastavené",
        pauseHelp: "Zmrazí túto aplikáciu a jej pomocné procesy. Kým ju neobnovíte, nepoužíva procesor ani batériu."
    )
    static let de = ProcessPauseStrings(
        pauseButton: "Pausieren",
        resumeButton: "Fortsetzen",
        resumeAllFormat: "Alle fortsetzen (%d pausiert)",
        pausedBadge: "Pausiert",
        pauseHelp: "Friert diese App und ihre Hilfsprozesse ein. Sie verbraucht weder Prozessorleistung noch Akku, bis du sie fortsetzt."
    )
    static let fr = ProcessPauseStrings(
        pauseButton: "Mettre en pause",
        resumeButton: "Reprendre",
        resumeAllFormat: "Tout reprendre (%d en pause)",
        pausedBadge: "En pause",
        pauseHelp: "Fige cette app et ses processus auxiliaires. Elle n’utilise ni processeur ni batterie jusqu’à sa reprise."
    )
    static let it = ProcessPauseStrings(
        pauseButton: "Metti in pausa",
        resumeButton: "Riprendi",
        resumeAllFormat: "Riprendi tutte (%d in pausa)",
        pausedBadge: "In pausa",
        pauseHelp: "Congela questa app e i suoi processi ausiliari. Non usa CPU né batteria finché non la riprendi."
    )
    static let ja = ProcessPauseStrings(
        pauseButton: "一時停止",
        resumeButton: "再開",
        resumeAllFormat: "すべて再開（一時停止中: %d）",
        pausedBadge: "一時停止中",
        pauseHelp: "このアプリと補助プロセスを凍結します。再開するまで CPU もバッテリーも使いません。"
    )
    static let ko = ProcessPauseStrings(
        pauseButton: "일시 정지",
        resumeButton: "재개",
        resumeAllFormat: "모두 재개 (일시 정지됨 %d개)",
        pausedBadge: "일시 정지됨",
        pauseHelp: "이 앱과 보조 프로세스를 정지시킵니다. 재개하기 전까지 CPU와 배터리를 사용하지 않습니다."
    )
    static let zhHans = ProcessPauseStrings(
        pauseButton: "暂停",
        resumeButton: "恢复",
        resumeAllFormat: "全部恢复（已暂停 %d 个）",
        pausedBadge: "已暂停",
        pauseHelp: "冻结此 App 及其辅助进程。恢复之前不会占用 CPU 和电量。"
    )
    static let zhTW = ProcessPauseStrings(
        pauseButton: "暫停",
        resumeButton: "繼續",
        resumeAllFormat: "全部繼續（已暫停 %d 個）",
        pausedBadge: "已暫停",
        pauseHelp: "凍結此 App 及其輔助程序。繼續之前不會使用 CPU 與電力。"
    )
    static let zhHK = ProcessPauseStrings(
        pauseButton: "暫停",
        resumeButton: "繼續",
        resumeAllFormat: "全部繼續（已暫停 %d 個）",
        pausedBadge: "已暫停",
        pauseHelp: "凍結此 App 及其輔助程序。繼續之前不會佔用 CPU 和電量。"
    )
    static let uk = ProcessPauseStrings(
        pauseButton: "Призупинити",
        resumeButton: "Відновити",
        resumeAllFormat: "Відновити всі (призупинено: %d)",
        pausedBadge: "Призупинено",
        pauseHelp: "Заморожує цей застосунок і його допоміжні процеси. Доки ви його не відновите, він не використовує процесор і батарею."
    )
}
