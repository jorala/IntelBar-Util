<h1 align="center">IntelBar Util</h1>

<p align="center">
  An unofficial fork of <a href="https://github.com/vorssaint/vorssaint-utils">Vorssaint</a>
  that builds and runs on Intel Macs.<br>
  One menu bar app doing the job of a dozen paid Mac utilities. Install only what you use.
</p>

<p align="center">
  <a href="#build-it-for-your-intel-mac">Build</a> ·
  <a href="#everything-it-does">Features</a> ·
  <a href="#differences-from-the-original">Differences</a> ·
  <a href="#private-by-default">Privacy</a> ·
  <a href="#credits">Credits</a> ·
  <a href="LICENSE">License</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-14%2B%20Intel%20%26%20Apple%20Silicon-black" alt="macOS 14 and newer, Intel and Apple Silicon">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0--or--later-blue" alt="License GPL 3.0 or later"></a>
</p>

> **This is not the official Vorssaint.** It is a personal, unofficial fork. It is not
> made, endorsed or supported by the original author. Please do not ask the original
> project for help with this fork. For the official app, go to
> [vorssaint/vorssaint-utils](https://github.com/vorssaint/vorssaint-utils).

Per app volume, a real system monitor, a better app switcher, window snapping, Dock previews, clipboard history, text snippets, a file shelf, an uninstaller. The utilities Mac users usually buy one by one, together behind a single menu bar icon, with no account, no telemetry and no subscription.

## Build it for your Intel Mac

Xcode Command Line Tools are the only requirement. In Terminal:

```
git clone https://github.com/jorala/IntelBar-Util
cd IntelBar-Util
./build.sh --dev --install
```

`--dev` installs a separate "Vorssaint (Developer)" app that will not collide with the official one. Running `./build.sh --install` without `--dev` builds the release version instead and installs it as "IntelBar Util" in `/Applications`. `build.sh` now targets your Mac's own architecture; use `--arch=x86_64` or `--arch=arm64` to choose one. Run the app from the installed bundle, not from Xcode's Run button: macOS notifications crash a bare executable.

## Differences from the original

- **Intel support.** `build.sh` builds for the host architecture instead of always `arm64`.
- **Apple Silicon only features are hidden on Intel.** Extra Brightness (needs the XDR display of M-series MacBook Pros) and Fan Control (uses the Apple Silicon fan interface) are unavailable on Intel Macs. They still work on Apple Silicon.
- **Some hardware readings may be limited on Intel**, such as per-core CPU grouping and some temperature sensors.
- This fork has been tested only lightly. Please report problems in this repository's issues.

## Everything it does

### Sound

- **Volume mixer.** Set volume per app, boost quiet audio past 100%, and pin or reorder favorites. No audio driver required.
- **Per app output.** Play music through speakers while a call uses your headset.
- **Output switcher.** Switch audio outputs with a shortcut and lower the volume when headphones disconnect.
- **Microphone tools.** Choose a preferred input, adjust its level on supported devices, and apply available microphone mute or input-volume controls with one shortcut. Siri and some apps may still hear you; Mic Mute is not a privacy lock. Its indicator shows that the feature is on, not that every app receives silence.
- **Music app blocker.** Prevent unwanted Music launches after detected playback-button presses. Requires Accessibility.

### Know what your Mac is doing

- **System monitor.** CPU, GPU, memory, temperatures, battery health and power use, with history graphs and a view of energy-hungry apps.
- **Menu bar readouts.** Put your chosen readings, usage bars, battery time or fan speed directly in the menu bar.
- **Network.** See live traffic, session totals and your local IP address, or run a speed test.
- **Alerts.** Get notified about sustained CPU load, high temperatures, memory pressure, low disk space or low battery.

### Windows and the Dock

- **App switcher.** Switch between apps and windows with live previews, search and display filters. A simpler mode works without screen capture.
- **Window layout.** Snap windows into layouts, move them between displays and restore earlier positions using shortcuts, screen edges or modifier-drag gestures.
- **Dock Preview.** Hover over Dock icons to preview windows across desktops. Switch, close, move or snap them from the preview.
- **Dock clicks.** Click an active app's Dock icon to minimize, hide or cycle through its windows.
- **Maximize windows.** Use the green button to fill the screen without creating another Space.
- **Fixed Space order.** Keep Spaces in the order you set instead of rearranging them by recent use. Turning it off restores your previous setting.
- **Quit on close.** Quit selected apps when their last window closes.
- **Quit and close protection.** Prevent accidental ⌘Q or ⌘W with a hold, double press or extra modifier, per app.

<p align="center">
  <img src="docs/assets/readme/quit-protection-hold.png" width="300" alt="The hold-to-confirm prompt showing progress below the Command-Q quit shortcut hint">
</p>

<p align="center">
  <img src="docs/assets/readme/window-switcher.gif" width="540" alt="The window switcher showing live thumbnails of open windows">
</p>

### Keyboard and mouse

- **Text snippets.** Expand short triggers into text with clipboard, date and time variables, or insert snippets from a searchable menu.
- **Smooth scrolling.** Give your mouse wheel a fluid glide with adjustable speed and response.
- **Pointer acceleration.** Disable mouse acceleration and restore your previous setting when turned off.
- **Linear scrolling.** Make every mouse wheel notch scroll the same number of lines, however fast the wheel spins.
- **Focus follows mouse.** Bring the window under the pointer forward after an adjustable pause.
- **Scroll direction.** Invert vertical and horizontal mouse scrolling independently of the trackpad.
- **Scroll sideways while holding a key.** Turn vertical wheel movement into horizontal scrolling while holding a chosen key.
- **Side buttons.** Use mouse Back and Forward buttons in Finder, browsers and compatible apps.
- **Mouse button shortcuts.** Assign keys to extra buttons and side wheels, or use button-drag gestures for Spaces and Mission Control.
- **Middle click.** Turn a three-finger trackpad press into a middle click.
- **Apps to leave alone.** Exclude chosen apps from mouse enhancements.
- **Extra click filter.** Ignore accidental rapid clicks from worn mouse buttons without delaying normal clicks.
- **Key debounce.** Filter repeated letters caused by a worn keyboard.
- **Super key.** Use Caps Lock or a right-side modifier as a shortcut combination, with a separate tap action and app exclusions.
- **Keyboard shortcuts.** Manage feature shortcuts in one place, including optional takeover of supported macOS shortcuts while a feature is active.

### Clipboard, files and links

- **Clipboard history.** Search local text, image and file history, pin favorites, preview entries and paste with shortcuts.
- **Auto clear clipboard.** Clear the system clipboard after a delay, sleep or lock, while keeping saved history.
- **Paste as plain text.** Paste without formatting while preserving the original clipboard content.
- **Shelf.** Park files, text and links near your cursor while dragging, then drop or share them later.
- **Finder shortcuts.** Move files with ⌘X and ⌘V, rename with F2, or paste copied images as PNG files.
- **Clean URL.** Remove tracking parameters from links, manually or automatically.
- **Disk image installer.** Install an app from a mounted disk image and eject it, with optional download cleanup.

### Everyday tools

- **Dynamic Island.** Keep music, notifications, calendars, timers, downloads and everyday controls around the camera cutout, or a simulated one on other Macs. Customize sections and shortcuts, with optional lyrics, a live equalizer, camera preview and file tools.
- **AI agents.** Follow Claude, Codex, OpenCode and GitHub Copilot in the Dynamic Island: plan limits and when they reset where available, tokens, API value, models, projects and live work, with a notice when a long task finishes. Codex's banked resets can be used from there too, and each extra Codex account (`CODEX_HOME`) can have a limits card of its own. Copilot uses local CLI/app session logs; its token totals update when shutdown metrics arrive, and aggregate API-value estimates use base rates.
- **Command Bar.** Search apps, windows, files, clipboard history, snippets and app menu commands from one field. Calculate, convert units, find emoji or run saved scripts.
- **Quick panel.** Open a floating palette of favorite tools with ⌃⌘V.
- **Quick toggles.** Switch appearance, hide desktop icons, eject disks, empty the Trash, lock the screen and more.
- **Quit apps.** See every open app in one list and quit them one by one, all at once or all but the one in front.
- **Radial menu.** Open a customizable wheel of apps, files, shortcuts and tools around the pointer, with profiles and submenus.
- **Scratchpad.** Keep autosaved notes in tabs, with Markdown preview and export, in a floating window or Dynamic Island.
- **Cleaning Mode.** Lock keyboard input while cleaning, with a black screen or a small visible indicator.

### Capture and create

- **Screen capture.** Switch between screenshots, recording, text recognition and color picking in one selector with a pixel magnifier.
- **Screenshot.** Capture an area, window, screen or scrolling page. Annotate, crop, redact, add backgrounds and watermarks, pin captures, send them through the Share menu or share an expiring link.
- **Screen recording.** Record with separate system-audio and microphone tracks. Trim, cut, add automatic zooms, blur private details and export video or GIFs, or share an expiring link.
- **Camera preview.** Check your camera in a floating mirror or Dynamic Island before a call.
- **Copy text from screen.** Recognize text offline from any screen area, or read a QR code.
- **Color picker.** Copy a screen color as HEX, RGB, HSL or SwiftUI code.
- **Media tools.** Compress and edit videos, batch-convert images, add watermarks, make GIFs and extract text, all locally.

### App management

- **App updates.** Check store apps, package-managed apps and supported developer feeds in one list. Install managed updates together or open an app's own updater.
- **Cleaner.** Remove caches, logs and app leftovers, manually or on a schedule.
- **Messaging downloads.** Review, organize or move messaging downloads to the Trash using retention rules.
- **Uninstaller.** Remove apps and review their related caches, preferences and helpers before moving them to the Trash.
- **Homebrew manager.** Search, install and remove formulae and casks without opening a terminal.
- **Port manager.** Find processes listening on network ports and stop them with Kill Process when installed.

### Energy and display

- **Keep awake.** Keep your Mac working on a timer, with the lid closed, or while selected apps, power or external displays are present.
- **Displays.** Control individual displays and brightness, with hardware control where supported, half or quarter steps for the brightness keys, optional extra dimming below a monitor's minimum, and software dimming as a fallback.
- **Bluetooth on sleep.** Disconnect Bluetooth during sleep and restore it on wake only if Vorssaint turned it off.

## Private by default

This fork keeps the original local-first design, with no account, analytics or tracking. The network is touched only by things you can see: update checks, the speed test, Homebrew actions, optional online lyric lookup, temporary screenshot or recording links and feedback you explicitly send. The full story is in the [privacy notes](docs/PRIVACY.md).

Permissions get the same treatment. Every one is optional, the app explains each in plain words, shows which features actually use it, and even tells you when a permission you granted is no longer needed by anything, with a shortcut to revoke it.

<p align="center">
  <img src="docs/assets/readme/permissions.png" width="720" alt="The Permissions page showing what each permission does, which features use it, and an unused permission warning">
</p>

See the [permissions guide](docs/PERMISSIONS.md) for which features need access and what remains available without it.

## What you need

- A Mac with an Intel processor
- macOS 14 Sonoma or newer
- Xcode Command Line Tools, to build it

## When something misbehaves

See [troubleshooting](docs/TROUBLESHOOTING.md) for launch problems, permissions and missing previews. Report problems with this fork in this repository's issues.

## Documentation

These documents come from the original project and describe it:

- [Privacy](docs/PRIVACY.md), what does and does not leave your Mac
- [Permissions](docs/PERMISSIONS.md), every macOS permission in plain words
- [Troubleshooting](docs/TROUBLESHOOTING.md), the common fixes
- [Contributing](CONTRIBUTING.md), build, layout and conventions
- [Security](SECURITY.md), how to report a vulnerability
- [Changelog](CHANGELOG.md), the original project's release history

## Credits

- **Vorssaint** was created by [@vorssaint](https://x.com/vorssaint). All of the original app, its design and nearly all of this code are their work. Original project: [vorssaint/vorssaint-utils](https://github.com/vorssaint/vorssaint-utils), website [vorssaint.com](https://vorssaint.com). If you like the app, please support the original author.
- The original Vorssaint app icon was designed by [@divisionseven](https://github.com/divisionseven). This fork uses its own generic chip icon drawn by @Jorala
- Intel Mac changes in this fork by [@jorala](https://github.com/jorala), with help from Claude (Anthropic).

## License

[GPL 3.0 or later](LICENSE), copyright 2026 Vorssaint. This fork is distributed under the same license and the source is in this repository. The license covers the source code; the Vorssaint name, logo and look belong to the original author and are covered separately in [TRADEMARKS.md](TRADEMARKS.md). This fork is unofficial and is not affiliated with the original project.
