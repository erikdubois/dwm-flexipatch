# flexi - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dwm.c util.c
OBJ = ${SRC:.c=.o}

# FreeBSD users, prefix all ifdef, else and endif statements with a . for this to work (e.g. .ifdef)

ifdef YAJLLIBS
all: flexi flexi-msg
else
all: flexi
endif

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk patches.h

config.h:
	cp config.def.h $@

patches.h:
	cp patches.def.h $@

flexi: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

ifdef YAJLLIBS
flexi-msg:
	${CC} -o $@ patch/ipc/dwm-msg.c ${LDFLAGS}
endif

clean:
	rm -f flexi ${OBJ}
	rm -f patches.h
	rm -f config.h

install: all
	rm -f /usr/bin/flexi
	cp flexi /usr/bin
	chmod 755 /usr/bin/flexi
	cp -vf flexi.desktop /usr/share/xsessions
	chmod 644 /usr/share/xsessions/flexi.desktop
ifdef YAJLLIBS
	cp -vf flexi-msg /usr/bin
endif
ifdef YAJLLIBS
	chmod 755 /usr/bin/flexi-msg
endif


uninstall:
	rm -f /usr/bin/flexi
	rm /usr/share/xsessions/flexi.desktop

.PHONY: all clean install uninstall
