Q=https://github.com/dugoh/auto-quas/raw/6ebf0b781fd23541fd1d179335381d82c767bb4b/4.3BSD-Quasijarus0c

WGET_OPTS=--quiet -O -

all: quas.tap

quas.tap: mkdisttap.pl \
	miniroot rootdump src.tar srcsys.tar stand usr.tar
	./mkdisttap.pl > quas.tap
.DELETE_ON_ERROdR: quas.tap

gzcompat: gzcompat.c
	gcc -o gzcompat gzcompat.c

miniroot: miniroot.Z
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@
.DELETE_ON_ERROR: miniroot

rootdump: rootdump.Z
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@
.DELETE_ON_ERROR: rootdump

src.tar: src.tar.Z
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@
.DELETE_ON_ERROR: src.tar

srcsys.tar: srcsys.tar.Z
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@
.DELETE_ON_ERROR: srcsys.tar

stand: stand.Z
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@
.DELETE_ON_ERROR: stand

usr.tar: usr.tar.Z
	wget $(WGET_OPTS) $(Q)/$@.Z | ./gzcompat | gzip -dc > $@
.DELETE_ON_ERROR: usr.tar


clean:
	rm -f gzcompat miniroot rootdump src.tar srcsys.tar stand \
	  usr.tar quas.tap quas.ra92* nvram.dat
.PHONY: clean
