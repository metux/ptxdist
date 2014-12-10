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
PACKAGES-$(PTXCONF_NETKIT_BASE) += netkit-base

#
# Paths and names
#
NETKIT_BASE_VERSION	:= 0.17
NETKIT_BASE_MD5		:= 1f0193358e92559ec0f598b09ccbc0ec
NETKIT_BASE		:= netkit-base-$(NETKIT_BASE_VERSION)
NETKIT_BASE_SUFFIX	:= tar.gz
NETKIT_BASE_URL		:= http://ibiblio.org/pub/linux/system/network/netkit/$(NETKIT_BASE).$(NETKIT_BASE_SUFFIX)
NETKIT_BASE_SOURCE	:= $(SRCDIR)/$(NETKIT_BASE).$(NETKIT_BASE_SUFFIX)
NETKIT_BASE_DIR		:= $(BUILDDIR)/$(NETKIT_BASE)
NETKIT_BASE_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
NETKIT_BASE_CONF_TOOL	:= autoconf
NETKIT_BASE_CONF_OPT	:= \
	--prefix=/usr \
	--installroot=$(NETKIT_BASE_PKGDIR) \
	--with-c-compiler=$(CROSS_CC)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/netkit-base.targetinstall:
	@$(call targetinfo)

	@$(call install_init, netkit-base)
	@$(call install_fixup, netkit-base,PRIORITY,optional)
	@$(call install_fixup, netkit-base,SECTION,base)
	@$(call install_fixup, netkit-base,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, netkit-base,DESCRIPTION,missing)

	@$(call install_copy, netkit-base, 0, 0, 0755, -, /bin/ping)
	@$(call install_copy, netkit-base, 0, 0, 0755, -, /usr/sbin/inetd)

	@$(call install_finish, netkit-base)

	@$(call touch)

# vim: syntax=make
