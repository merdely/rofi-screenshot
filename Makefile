DESTDIR ?= /usr/local
progname = rofi-screenshot
version = $(shell cat version.txt)
group = root
ifeq (`uname -s`), OpenBSD)
	group = bin
endif
ifeq (`uname -s`), Darwin)
	group = bin
endif

help:
	@echo "Usage:"
	@echo "  SYSTEM WIDE INSTALL:"
	@echo "  'sudo make install-system': Install in $(DESTDIR)/bin"
	@echo "  'sudo make DESTDIR=/usr install-system': Install in /usr/bin"
	@echo "  'sudo make DESTDIR=/opt install-system': Install in /opt/bin"
	@echo
	@echo "  USER INSTALL:"
	@echo "  'make install-user': Install in "'$$'"HOME/bin"

install:
	@echo "Use 'make install-system' for system-wide install to $(DESTDIR)"
	@echo "Use 'make install-user' for user install to $(HOME)/bin"

install-user:
	install -d -m 755 $(HOME)/bin
	install -m 755 $(progname) $(HOME)/bin/$(progname)

install-system:
ifeq ($(LOGNAME), root)
	install -d -o root -g `id -gn root` -m 755 $(DESTDIR)/bin
	install -o root -g $(group) $(progname) -m 755 $(DESTDIR)/bin/$(progname)
else
	@echo "Error: You must be root to run 'make install-system' (use sudo)"
endif

build:
	mkdir -p build/$(progname)-$(version)
	cp README.md LICENSE Makefile $(progname) build/$(progname)-$(version)/

$(progname)-$(version).tar.gz: build
	cd build && tar -czf ../$(progname)-$(version).tar.gz $(progname)-$(version)

package: $(progname)-$(version).tar.gz

clean:
	rm -Rf build $(progname)-*.tar.gz
