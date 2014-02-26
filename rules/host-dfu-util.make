# -*-makefile-*-
#
# Copyright (C) 2014 by Sascha Hauer <s.hauer@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_DFU_UTIL) += host-dfu-util

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
HOST_DFU_UTIL_CONF_TOOL	:= autoconf

# vim: syntax=make