# -*-makefile-*-
#
# Copyright (C) 2006 by Robert Schwebel
#               2010 by Marc Kleine-Budde <mkl@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BINUTILS) += binutils

#
# Paths and names
#
ifeq ($(shell which $(CROSS_LD) 2>/dev/null),)
BINUTILS_VERSION	:= unknown
else
BINUTILS_VERSION	:= $(shell $(CROSS_LD) -v | sed -e 's/.* \(.*\)$$/\1/g')
BINUTILS_MD5		:= none
endif
BINUTILS		:= binutils-$(BINUTILS_VERSION)
BINUTILS_SUFFIX		:= tar.bz2
BINUTILS_URL		:= $(call ptx/mirror, GNU, binutils/$(BINUTILS).$(BINUTILS_SUFFIX))
BINUTILS_SOURCE		:= $(SRCDIR)/$(BINUTILS).$(BINUTILS_SUFFIX)
BINUTILS_DIR		:= $(BUILDDIR)/$(BINUTILS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
BINUTILS_AUTOCONF := \
	$(CROSS_AUTOCONF_USR) \
	--target=$(PTXCONF_GNU_TARGET) \
	--enable-targets=$(PTXCONF_GNU_TARGET) \
	--disable-nls \
	--enable-commonbfdlib \
	--enable-install-libiberty \
	--disable-multilib \
	--disable-werror

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/binutils.targetinstall:
	@$(call targetinfo)

	@$(call install_init, binutils)
	@$(call install_fixup, binutils,PRIORITY,optional)
	@$(call install_fixup, binutils,SECTION,base)
	@$(call install_fixup, binutils,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, binutils,DESCRIPTION,missing)

ifdef PTXCONF_BINUTILS_READELF
	@$(call install_copy, binutils, 0, 0, 0755, -, /usr/bin/readelf)
endif
ifdef PTXCONF_BINUTILS_OBJDUMP
	@$(call install_copy, binutils, 0, 0, 0755, -, /usr/bin/objdump)
endif
	@$(call install_finish, binutils)

	@$(call touch)

# vim: syntax=make

