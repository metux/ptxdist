# -*-makefile-*- 
# $Id: bootdisk.make,v 1.13 2003/12/20 11:03:31 bsp Exp $
#
# Copyright (C) 2002 by Pengutronix e.K., Hildesheim, Germany
# See CREDITS for details about who has contributed to this project. 
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
#ifeq (y, $(PTXCONF_BOOTDISK))
#PACKAGES += bootdisk
#endif

#
# Paths and names 
#

BOOTDISK_DIR = $(TOPDIR)/bootdisk
BOOTDISK_IMG = $(BOOTDISK_DIR)/boot.img

ifdef PTXCONF_BOOTDISK_DEV
BOOTDISK_DEV = `cat > $TMPDEVLIST << _EOF_ \
/dev/ram0         b  640  0     0       1       0 \
/dev/mem          c  640  0     0       1       1 \
/dev/kmem         c  640  0     0       1       2 \
/dev/null         c  640  0     0       1       3 \
/dev/zero         c  640  0     0       1       5 \
/dev/random       c  640  0     0       1       8 \
/dev/urandom      c  640  0     0       1       9 \
/dev/ttyS0        c  640  0     0       4       64 \
/dev/console      c  640  0     0       5       1 \
/dev/ptmx         c  640  0     0       5       2 \
/dev/pts/0        c  640  0     0       136     0 \
_EOF_`
else
BOOTDISK_DEV =
endif

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

bootdisk_targetinstall: $(STATEDIR)/bootdisk.targetinstall

bootdisk_targetinstall_deps = $(STATEDIR)/kernel.compile
bootdisk_targetinstall_deps += $(STATEDIR)/grub.compile
bootdisk_targetinstall_deps += $(STATEDIR)/e2fsprogs.compile
bootdisk_targetinstall_deps += $(STATEDIR)/ncurses.compile
bootdisk_targetinstall_deps += $(STATEDIR)/hosttool-genext2fs.install
bootdisk_targetinstall_deps += $(STATEDIR)/hosttool-util-linux.install

$(STATEDIR)/bootdisk.targetinstall: $(bootdisk_targetinstall_deps)
	@$(call targetinfo, $@)	
	cp $(GRUB_DIR)/stage1/stage1 $(BOOTDISK_IMG)
	cat $(GRUB_DIR)/stage2/stage2 >> $(BOOTDISK_IMG)
	cp $(BOOTDISK_IMG) $(BOOTDISK_IMG).grub
	/bin/ls -l $(BOOTDISK_IMG) | \
	awk '{size = $$5} END{size = $(PTXCONF_BOOTDISK_HEAD)*$(PTXCONF_BOOTDISK_SECT)*512 - size;for (i = 0; i < size; i++) printf ("\xff")}' >> $(BOOTDISK_IMG)
	$(PTXCONF_PREFIX)/bin/genext2fs -r 0 -d $(TOPDIR)/root \
		-b $(PTXCONF_BOOTDISK_SIZE) \
		$(BOOTDISK_DEV) \
		$(BOOTDISK_IMG).ext2
	cat $(BOOTDISK_IMG).ext2 >> $(BOOTDISK_IMG)
	if [ -f $(TOPDIR)/config/bootdisk/$(PTXCONF_BOOTDISK_PART) ] ; then \
	   $(PTXCONF_PREFIX)/sbin/sfdisk -H $(PTXCONF_BOOTDISK_HEAD) \
	   -S $(PTXCONF_BOOTDISK_SECT) -f $(BOOTDISK_IMG) < \
	   	$(TOPDIR)/config/bootdisk/$(PTXCONF_BOOTDISK_PART) ; \
	fi
	touch $@

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

bootdisk_clean: 
	rm -rf $(STATEDIR)/bootdisk.* $(BOOTDISK_IMG)*

# vim: syntax=make
