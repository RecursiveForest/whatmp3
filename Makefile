# whatmp3 - audio transcoder and torrent creator
# See LICENSE file for copyright and license details.

include config.mk

SRC = whatmp3.py
OBJ = ${SRC:.py=}

all: whatmp3

whatmp3: $@
	@echo cp ${SRC} ${OBJ}
	@cp ${SRC} ${OBJ}

clean:
	@echo cleaning
	@rm -f whatmp3 ${OBJ} whatmp3-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p whatmp3-${VERSION}
	@cp -R LICENSE Makefile README.md config.mk \
		whatmp3.1 ${SRC} whatmp3-${VERSION}
	@tar -cf whatmp3-${VERSION}.tar whatmp3-${VERSION}
	@gzip whatmp3-${VERSION}.tar
	@rm -rf whatmp3-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f whatmp3 ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/whatmp3
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < whatmp3.1 > ${DESTDIR}${MANPREFIX}/man1/whatmp3.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/whatmp3.1

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/whatmp3
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/whatmp3.1

.PHONY: all clean dist install uninstall
