# Noiz2sa makefile(MinGW 2.0.0)
# $Id: Makefile,v 1.4 2003/08/10 09:00:05 kenta Exp $

.PHONY: all clean

SYSROOT = $(shell $(CC) --print-sysroot)
PKGCONF = $(SYSROOT)/../../bin/pkg-config

PROG        = $(NAME)
BULLETML    = src/bulletml/libbulletml.a

DEFAULT_CFLAGS = `$(PKGCONF) --cflags sdl SDL_mixer` -I src/bulletml
LDFLAGS        = `$(PKGCONF) --libs sdl SDL_mixer` -L. -Lsrc/bulletml -lbulletml -lstdc++ -lm

MORE_CFLAGS = -O3

CFLAGS  = $(DEFAULT_CFLAGS) $(MORE_CFLAGS)
CPPFLAGS  = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -I./bulletml/

OBJS = $(addprefix src/, $(NAME).o ship.o shot.o frag.o bonus.o \
	foe.o foecommand.o barragemanager.o attractmanager.o \
	background.o letterrender.o screen.o clrtbl.o \
	vector.o degutil.o rand.o soundmanager.o)

all: $(PROG)

$(BULLETML):
	make CC=$(CC) CXX=$(CXX) -C src/bulletml

$(PROG): $(OBJS) $(BULLETML)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) $(LDFLAGS)

clean:
	$(RM) $(PROG) src/*.o
	make -C src/bulletml clean
