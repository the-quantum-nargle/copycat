# copycat

[![Version](https://img.shields.io/badge/version-0.1.0-blue)](https://github.com/the-quantum-nargle/copycat/releases)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey)](https://github.com/the-quantum-nargle/copycat)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

**Copy anything from the terminal to your clipboard.**

`copycat` is a tiny macOS CLI that reads files or piped input and puts them on your clipboard — text, images, or command output. No more selecting text in a terminal window or saving screenshots to disk just to paste them somewhere else.

---

## Install

### Homebrew

```bash
brew tap the-quantum-nargle/copycat
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

Paste into Notes, Slack, an email, or anywhere else.

### Copy an image

```bash
copycat screenshot.png
```

Paste into Messages, Figma, or Preview. Works with `png`, `jpg`, `jpeg`, `gif`, `bmp`, `tiff`, and `webp`.

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

## Why copycat?

- **One command.** No selecting, no saving, no context-switching.
- **Images too.** Most terminal copy tools only handle text.
- **Pipes naturally.** It works the way you already use the shell.
- **Mac-native.** Built with `NSPasteboard`, so it plays nicely with every app.

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
