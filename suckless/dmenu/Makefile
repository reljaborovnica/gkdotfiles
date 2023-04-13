# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c stest.c util.c stackblur.c stacktint.c
OBJ = ${SRC:.c=.o}

all: options dmenu stest

options:
	@echo dmenu build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

${OBJ}: arg.h config.h config.mk drw.h stackblur.h stacktint.h

dmenu: dmenu.o drw.o util.o stackblur.o stacktint.o
	@echo CC -o $@
	@${CC} -pthread -o $@ dmenu.o drw.o util.o stackblur.o stacktint.o ${LDFLAGS}

stest: stest.o
	@echo CC -o $@
	@${CC} -o $@ stest.o ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f dmenu stest ${OBJ} dmenu-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p dmenu-${VERSION}
	@cp LICENSE Makefile README arg.h config.def.h config.mk dmenu.1 \
		drw.h util.h dmenu_path dmenu_run dmenu_win dmenu_vol dmenu_bl dmenu_media dmenu_custom dmenu_home dmenu_apps dmenu_all stest.1 ${SRC} \
		dmenu-${VERSION}
	@tar -cf dmenu-${VERSION}.tar dmenu-${VERSION}
	@gzip dmenu-${VERSION}.tar
	@rm -rf dmenu-${VERSION}

install: all
	@echo installing executables to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f dmenu dmenu_path dmenu_run dmenu_win dmenu_vol dmenu_bl dmenu_media dmenu_custom dmenu_home dmenu_apps dmenu_all stest ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_path
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_run
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_win
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_vol
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_bl
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_media
	@chmod 755 ${DESTDIR}${PREFIX}/bin/stest
	@echo installing manual pages to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < dmenu.1 > ${DESTDIR}${MANPREFIX}/man1/dmenu.1
	@sed "s/VERSION/${VERSION}/g" < stest.1 > ${DESTDIR}${MANPREFIX}/man1/stest.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/dmenu.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/stest.1

uninstall:
	@echo removing executables from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu_path
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu_run
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu_win
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu_vol
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu_bl
	@rm -f ${DESTDIR}${PREFIX}/bin/dmenu_media
	@rm -f ${DESTDIR}${PREFIX}/bin/stest
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/dmenu.1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/stest.1

.PHONY: all options clean dist install uninstall
