Q:=https://github.com/dugoh/auto-quas/raw/6ebf0b781fd23541fd1d179335381d82c767bb4b/4.3BSD-Quasijarus0c

TAPE_SECTIONS:=miniroot rootdump src.tar srcsys.tar stand usr.tar

DISK_TYPE=ra92

all: quas.$(DISK_TYPE)
.PHONY: all

quas.$(DISK_TYPE): ./mkdisk.sh ./00_install.expect ./01_install.expect quas.tap boot.ini install.ini
	./mkdisk.sh $(DISK_TYPE) $@
	./00_install.expect $(DISK_TYPE)
	./01_install.expect $(DISK_TYPE)

%.ini:%.ini.templ
	sed -e s/%DISK_TYPE%/$(DISK_TYPE)/g < $^ > $@

gzcompat: gzcompat.c
	gcc -o gzcompat gzcompat.c

$(TAPE_SECTIONS): gzcompat
	wget --quiet -O - $(Q)/$@.Z | ./gzcompat | gzip -dc > $@

quas.tap: mkdisttap.pl $(TAPE_SECTIONS)
	./mkdisttap.pl > quas.tap

clean:
	rm -f gzcompat quas.tap quas.$(DISK_TYPE) nvram.dat $(TAPE_SECTIONS) \
		boot.ini install.ini

.PHONY: clean

.DELETE_ON_ERROR:
