ISO:=NetBSD-9.3-vax.iso
ISO_URL:=http://ftp.netbsd.org/pub/NetBSD/iso/9.3/

DISK_TYPE=ra92

all: netbsd.$(DISK_TYPE)
.PHONY: all

netbsd.$(DISK_TYPE): ./mkdisk.sh ./00_install.expect ./01_install.expect $(ISO) boot.ini install.ini
	./mkdisk.sh $(DISK_TYPE) $@
	./00_install.expect $(DISK_TYPE)

%.ini:%.ini.templ
	sed -e s/%DISK_TYPE%/$(DISK_TYPE)/g -e s/%ISO%/$(ISO)/g < $^ > $@

$(ISO):
	wget --quiet -O $@ $(ISO_URL)/$@

clean:
	rm -f netbsd.$(DISK_TYPE) nvram.dat \
		boot.ini install.ini

.PHONY: clean

.DELETE_ON_ERROR:
