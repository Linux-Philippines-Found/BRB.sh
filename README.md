# BRB.sh 🧋🐰

A lightweight, zero-dependency, ultra-portable "Be Right Back" terminal screen — featuring a blinking boba-drinking rabbit, floating `zZz` sleep animations, and a smooth spinner loop.

Built strictly with native POSIX Bash constructs and ANSI escape sequences for smooth, flicker-free performance.

```
 (\_/)
 ( -_-)
 / >🧋  zZz

+-----------------+
|  BE RIGHT BACK  |
+-----------------+

away since: 14:32:07
(press Ctrl+C when you're back)

⠋ waiting...
```

## 🌟 Highlights

- **Zero Dependencies** — pure Bash using only standard core utilities (`date`, `tput`, `sleep`, `printf`).
- **Flicker-Free Rendering** — cursor repositioning instead of clearing the screen, so there's no redraw strobing.
- **Universal Compatibility** — runs anywhere with a Bash shell and a terminal emulator.
- **Graceful Exit** — traps `SIGINT`/`SIGTERM`/`EXIT` to restore cursor visibility (`tput cnorm`) and clean up the screen on the way out.

## 📦 Compatibility

| Environment / OS | Status | Notes |
|---|---|---|
| Linux (Debian, Arch, Fedora, CachyOS, etc.) | ✅ Fully Supported | Works natively in any terminal emulator (Alacritty, Kitty, Konsole, GNOME Terminal) |
| Android (Termux) | ✅ Fully Supported | Runs directly, no root or X11 setup needed |
| ChromeOS (Chromebrew / Crosh) | ✅ Fully Supported | Run via `bash brb.sh` or install to `/usr/local/bin` — see note below |
| Windows (WSL / Git Bash) | ✅ Fully Supported | Compatible across WSL1/WSL2 distros and MSYS2 terminal buffers |
| macOS | ✅ Fully Supported | Native execution via Terminal or iTerm2 |

## 🚀 Quick Start

### Option 1: One-liner (fastest for Termux & most distros)

```bash
curl -sO https://raw.githubusercontent.com/Linux-Philippines-Found/BRB.sh/main/brb.sh && chmod +x brb.sh && ./brb.sh
```

### Option 2: Clone the repository

```bash
git clone https://github.com/Linux-Philippines-Found/BRB.sh.git
cd BRB.sh
chmod +x brb.sh
./brb.sh
```

When you're ready to stop, press `Ctrl+C` — the script restores your terminal cleanly.

## 🔧 ChromeOS / Chromebrew Note

ChromeOS mounts `MyFiles` and `Downloads` with the `noexec` flag, so running `./brb.sh` directly from those folders will throw a `Permission denied` error.

**Workaround 1 — invoke through the interpreter:**

```bash
bash brb.sh
```

**Workaround 2 — install it into an executable PATH:**

```bash
cp brb.sh /usr/local/bin/brb
chmod +x /usr/local/bin/brb
brb
```

## 🛠️ How It Works

The script draws each animation frame at a fixed cursor position (`\033[H`) rather than clearing the terminal every loop, which avoids the flicker most naive "clear and reprint" scripts suffer from. Each frame pairs three animated elements:

- a `zZz` sleep counter that grows and shrinks,
- blinking eyes (`-_-` / `•_•`) for a subtle idle animation,
- and a Braille spinner (`⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏`) to show the script is still alive.

A `trap` on `INT`, `TERM`, and `EXIT` guarantees the cursor is restored (`tput cnorm`) and the screen is cleared no matter how the script is stopped.

## 🤝 Credits

- **Original Concept & Inspiration** — Raptor (`raptorsaurus_1`) for the initial idea.
- **Refactoring, Loop Optimization & Packaging** — Lance (`@Lance@Debian13`) — flicker-free rendering and packaging.

## 📄 License

Unlicensed / Public Domain. Licensing a single-file shell script felt like unnecessary overhead — fork it, modify it, embed it, or break it however you like.
