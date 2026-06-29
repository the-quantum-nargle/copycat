# copycat

[![Version](https://img.shields.io/badge/version-0.1.0-blue)](https://github.com/the-quantum-nargle/copycat/releases)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)](https://github.com/the-quantum-nargle/copycat)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

**Copy anything from the terminal to your clipboard.**

`copycat` is a small Mac CLI. Point it at a file or pipe something into it, and the contents land on your clipboard. Text files, images, command output: whatever. No more dragging to select terminal text or saving screenshots just to paste them.

---

## Install

### Homebrew

```bash
brew tap the-quantum-nargle/copycat
brew trust the-quantum-nargle/copycat
brew install copycat
```

### Build from source

```bash
git clone https://github.com/the-quantum-nargle/copycat.git
cd copycat
make install
```

---

## Usage

### Copy a text file

```bash
copycat notes.txt
```

Paste into Notes, Slack, an email, wherever.

### Copy an image

```bash
copycat screenshot.png
```

Paste into Messages, Figma, Preview. Works with `png`, `jpg`, `jpeg`, `gif`, `bmp`, `tiff`, and `webp`.

### Copy command output

```bash
cat notes.txt | copycat
git diff | copycat
ls -la | copycat
```

### Check the version

```bash
copycat --version
```

---

## Supported formats

| Input | What gets copied |
|-------|------------------|
| Text files (`.txt`, `.md`, `.json`, etc.) | Plain text |
| Images (`.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.tiff`, `.tif`, `.webp`) | Image object |
| Piped stdin | Plain text |

---

## Why use it?

- **One command.** No selecting, no saving, no jumping around.
- **Images too.** Most clipboard tools from the terminal only do text.
- **Works with pipes.** It fits how you already use the shell.
- **Mac-native.** Uses `NSPasteboard`, so pasted content works in any app.

---

## Development

```bash
swift build              # debug build
swift build -c release   # release build
make install             # install to /usr/local/bin
```

---

## License

[MIT](LICENSE)
