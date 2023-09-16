Q:=https://github.com/dugoh/auto-quas/raw/6ebf0b781fd23541fd1d179335381d82c767bb4b/4.3BSD-Quasijarus0c

TAPE_SECTIONS:=miniroot rootdump src.tar srcsys.tar stand usr.tar

all: quas.ra92
.PHONY: all

quas.ra92: ./mkdisk.sh ./00_install.expect ./01_install.expect quas.tap
	./mkdisk.sh $@
	./00_install.expect
	./01_install.expect

gzcompat: gzcompat.c
	gcc -o gzcompat gzcompat.c

$(TAPE_SECTIONS): gzcompat
	wget --quiet -O - $(Q)/$@.Z | ./gzcompat | gzip -dc > $@

quas.tap: mkdisttap.pl $(TAPE_SECTIONS)
	./mkdisttap.pl > quas.tap

clean:
	rm -f gzcompat quas.tap quas.ra92* nvram.dat $(TAPE_SECTIONS) 
.PHONY: clean

.DELETE_ON_ERROR:
