Q=https://github.com/dugoh/auto-quas/raw/6ebf0b781fd23541fd1d179335381d82c767bb4b/4.3BSD-Quasijarus0c

WGET_OPTS=--quiet -O -

all: quas.tap
.PHONY: all

quas.tap: mkdisttap.pl \
	miniroot rootdump src.tar srcsys.tar stand usr.tar
	./mkdisttap.pl > quas.tap

gzcompat: gzcompat.c
	gcc -o gzcompat gzcompat.c

miniroot: miniroot.Z
rootdump: rootdump.Z
src.tar: src.tar.Z
srcsys.tar: srcsys.tar.Z
stand: stand.Z
usr.tar: usr.tar.Z

%:%.Z gzcompat
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@

clean:
	rm -f gzcompat miniroot rootdump src.tar srcsys.tar stand \
	  usr.tar quas.tap quas.ra92* nvram.dat
.PHONY: clean

.DELETE_ON_ERROR:
