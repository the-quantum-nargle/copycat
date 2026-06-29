# copycat

Copy anything from the terminal to the clipboard.

```bash
copycat file.txt          # copy text file contents
copycat screenshot.png    # copy image to clipboard
cat file.txt | copycat    # copy piped text
```

## Build

```bash
swift build
```

## Install locally

```bash
swift build -c release
cp .build/release/copycat /usr/local/bin/
```

## TODO

- [ ] Pipe binary/images with explicit type flag
- [ ] Homebrew formula
- [ ] Copy files (not just their contents)
