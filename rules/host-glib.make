# -*-makefile-*-
#
# Copyright (C) 2007 by Luotao Fu <lfu@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_GLIB) += host-glib

#
# Paths and names
#
HOST_GLIB_DIR	= $(HOST_BUILDDIR)/$(GLIB)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_GLIB_PATH	:= PATH=$(HOST_PATH)
HOST_GLIB_ENV 	:= $(HOST_ENV)

#
# autoconf
#
# 'iconv' feature: configure tests for this feature in the glibc first. If not
#                  found it checks for iconv library in the next step. On most
#                  hosts 'iconv' should be present in the regular host glibc.
#
HOST_GLIB_AUTOCONF := \
	$(HOST_AUTOCONF) \
	--enable-silent-rules \
	--disable-debug \
	--disable-rebuilds \
	--disable-modular-tests \
	--disable-static \
	--enable-shared \
	--disable-fam \
	--disable-libelf \
	--disable-gtk-doc \
	--disable-man \
	--disable-dtrace \
	--disable-systemtap \
	--disable-gcov \
	--with-libiconv=gnu

# vim: syntax=make
