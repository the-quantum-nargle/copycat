PREFIX ?= /usr/local

.PHONY: build release install clean

build:
	swift build

release:
	swift build -c release

install: release
	install -d $(PREFIX)/bin
	install -m 0755 .build/release/copycat $(PREFIX)/bin/copycat

clean:
	rm -rf .build
