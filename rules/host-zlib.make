# -*-makefile-*-
# $Id$
#
# Copyright (C) 2002 by Pengutronix e.K., Hildesheim, Germany
# See CREDITS for details about who has contributed to this project. 
#
# For further information about the PTXdist project and license conditions
# see the README file.
#


HOST_PACKAGES-$(HOST_ZLIB) += host-zlib

#
# Paths and names 
#
HOST_ZLIB_BUILDDIR	= $(HOST_BUILDDIR)/$(ZLIB)

include $(call package_depfile)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

host-zlib_get: $(STATEDIR)/host-zlib.get

$(STATEDIR)/host-zlib.get: $(STATEDIR)/zlib.get
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

host-zlib_extract: $(STATEDIR)/host-zlib.extract

$(STATEDIR)/host-zlib.extract: $(STATEDIR)/host-zlib.get
	@$(call targetinfo, $@)
	@$(call clean, $(HOST_ZLIB_BUILDDIR))
	@$(call extract, $(ZLIB_SOURCE), $(HOST_BUILDDIR))
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

host-zlib_prepare: $(STATEDIR)/host-zlib.prepare

#
# autoconf without automake :-(
#

HOST_ZLIB_AUTOCONF	=  --prefix=$(PTXCONF_HOST_PREFIX)/usr
HOST_ZLIB_AUTOCOHF +=  --shared
HOST_ZLIB_MAKEVARS	=  $(HOSTCC_ENV)

$(STATEDIR)/host-zlib.prepare: $(STATEDIR)/host-zlib.extract
	@$(call targetinfo, $@)
	cd $(HOST_ZLIB_BUILDDIR) && \
		./configure $(HOST_ZLIB_AUTOCONF)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

host-zlib_compile: $(STATEDIR)/host-zlib.compile

$(STATEDIR)/host-zlib.compile: $(STATEDIR)/host-zlib.prepare 
	@$(call targetinfo, $@)
	cd $(HOST_ZLIB_BUILDDIR) && make $(HOST_ZLIB_MAKEVARS)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

host-zlib_install: $(STATEDIR)/host-zlib.install

$(STATEDIR)/host-zlib.install: $(STATEDIR)/host-zlib.compile
	@$(call targetinfo, $@)
	@$(call install, HOST_ZLIB, $(HOST_ZLIB_BUILDDIR),h)
	@$(call touch, $@)
# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

host-zlib_targetinstall: $(STATEDIR)/host-zlib.targetinstall

$(STATEDIR)/host-zlib.targetinstall: $(STATEDIR)/host-zlib.install
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

host-zlib_clean:
	rm -rf $(STATEDIR)/host-zlib.*
	rm -rf $(HOST_ZLIB_BUILDDIR)

# vim: syntax=make
