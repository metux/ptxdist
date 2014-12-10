# -*-makefile-*-
#
# Copyright (C) 2012 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_TCPREPLAY) += tcpreplay

#
# Paths and names
#
TCPREPLAY_VERSION	:= 3.4.4
TCPREPLAY_MD5		:= 22725feb9b2590809f9350308ec65180
TCPREPLAY		:= tcpreplay-$(TCPREPLAY_VERSION)
TCPREPLAY_SUFFIX	:= tar.gz
TCPREPLAY_URL		:= $(call ptx/mirror, SF, tcpreplay/$(TCPREPLAY).$(TCPREPLAY_SUFFIX))
TCPREPLAY_SOURCE	:= $(SRCDIR)/$(TCPREPLAY).$(TCPREPLAY_SUFFIX)
TCPREPLAY_DIR		:= $(BUILDDIR)/$(TCPREPLAY)
TCPREPLAY_LICENSE	:= GPLv3

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

TCPREPLAY_CONF_ENV	:= \
	$(CROSS_ENV) \
	tr_cv_libpcap_version=">= 0.9.6" \
	libopts_cv_test_dev_zero=yes \
	ac_cv_path_tcpdump_path=/usr/sbin/tcpdump

#
# autoconf
#
TCPREPLAY_CONF_TOOL	:= autoconf
TCPREPLAY_CONF_OPT	:= \
	$(CROSS_AUTOCONF_USR) \
	$(GLOBAL_LARGE_FILE_OPTION) \
	--disable-debug \
	--disable-dmalloc \
	--disable-pedantic \
	--disable-efence \
	--disable-gprof \
	--enable-64bits \
	--enable-force-pf \
	--enable-dynamic-link \
	--enable-local-libopts \
	--with-libpcap=$(SYSROOT)/usr \
	--without-libdnet \
	--without-libregex


# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tcpreplay.targetinstall:
	@$(call targetinfo)

	@$(call install_init, tcpreplay)
	@$(call install_fixup, tcpreplay,PRIORITY,optional)
	@$(call install_fixup, tcpreplay,SECTION,base)
	@$(call install_fixup, tcpreplay,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, tcpreplay,DESCRIPTION,missing)

	@$(call install_copy, tcpreplay, 0, 0, 0755, -, /usr/bin/tcpbridge)
	@$(call install_copy, tcpreplay, 0, 0, 0755, -, /usr/bin/tcpprep)
	@$(call install_copy, tcpreplay, 0, 0, 0755, -, /usr/bin/tcpreplay)
	@$(call install_copy, tcpreplay, 0, 0, 0755, -, /usr/bin/tcpreplay-edit)
	@$(call install_copy, tcpreplay, 0, 0, 0755, -, /usr/bin/tcprewrite)

	@$(call install_finish, tcpreplay)

	@$(call touch)

# vim: syntax=make
