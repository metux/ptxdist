# -*-makefile-*-
# $Id: template-make 8509 2008-06-12 12:45:40Z mkl $
#
# Copyright (C) 2008 by J.Kilb
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_GPSD) += gpsd

#
# Paths and names
#
GPSD_VERSION	:= 2.39
GPSD		:= gpsd-$(GPSD_VERSION)
GPSD_SUFFIX	:= tar.gz
GPSD_URL	:= http://download.berlios.de/gpsd/$(GPSD).$(GPSD_SUFFIX)
GPSD_SOURCE	:= $(SRCDIR)/$(GPSD).$(GPSD_SUFFIX)
GPSD_DIR	:= $(BUILDDIR)/$(GPSD)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(GPSD_SOURCE):
	@$(call targetinfo)
	@$(call get, GPSD)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

GPSD_PATH	:= PATH=$(CROSS_PATH)
GPSD_ENV 	:= $(CROSS_ENV)

#
# autoconf
#
GPSD_AUTOCONF := \
	$(CROSS_AUTOCONF_USR) \
	--without-x \
	--enable-dependency-tracking

ifdef PTXCONF_GPSD_PYTHON
GPSD_AUTOCONF += --enable-python
else
GPSD_AUTOCONF += --disable-python
endif

ifdef PTXCONF_GPSD_PROFILING
GPSD_AUTOCONF += --enable-profiling
else
GPSD_AUTOCONF += --disable-profiling
endif

ifdef PTXCONF_GPSD_NTPSHM
GPSD_AUTOCONF += --enable-ntpshm
else
GPSD_AUTOCONF += --disable-ntpshm
endif

ifdef PTXCONF_GPSD_PPS
GPSD_AUTOCONF += --enable-pps
else
GPSD_AUTOCONF += --disable-pps
endif

ifdef PTXCONF_GPSD_PPS_ON_CTS
GPSD_AUTOCONF += --enable-pps-on-cts
else
GPSD_AUTOCONF += --disable-pps-on-cts
endif

ifneq ($(call remove_quotes,$(PTXCONF_GPSD_DRIVER_USER)),)
GPSD_AUTOCONF += --enable-gpsd-user=$(PTXCONF_GPSD_DRIVER_USER)
endif
ifneq ($(call remove_quotes,$(PTXCONF_GPSD_FIXED_PORT_SPEED)),)
GPSD_AUTOCONF += --enable-fixed-port-speed=$(PTXCONF_GPSD_FIXED_PORT_SPEED)
endif

ifdef PTXCONF_GPSD_DBUS
GPSD_AUTOCONF += --enable-dbus
else
GPSD_AUTOCONF += --disable-dbus
endif

ifneq ($(call remove_quotes,$(PTXCONF_GPSD_MAX_CLIENTS)),)
GPSD_AUTOCONF += --enable-max-clients=$(PTXCONF_GPSD_MAX_CLIENTS)
endif
ifneq ($(call remove_quotes,$(PTXCONF_GPSD_MAX_DEVICES)),)
GPSD_AUTOCONF += --enable-max-devices=$(PTXCONF_GPSD_MAX_DEVICES)
endif

ifdef PTXCONF_GPSD_DRIVER_NMEA
GPSD_AUTOCONF += --enable-nmea
else
GPSD_AUTOCONF += --disable-nmea
endif

ifdef PTXCONF_GPSD_DRIVER_SIRF
GPSD_AUTOCONF += --enable-sirf
else
GPSD_AUTOCONF += --disable-sirf
endif

ifdef PTXCONF_GPSD_DRIVER_TSIP
GPSD_AUTOCONF += --enable-tsip
else
GPSD_AUTOCONF += --disable-tsip
endif

ifdef PTXCONF_GPSD_DRIVER_FV18
GPSD_AUTOCONF += --enable-fv18
else
GPSD_AUTOCONF += --disable-fv18
endif

ifdef PTXCONF_GPSD_DRIVER_TRIPMATE
GPSD_AUTOCONF += --enable-tripmate
else
GPSD_AUTOCONF += --disable-tripmate
endif

ifdef PTXCONF_GPSD_DRIVER_EARTHMATE
GPSD_AUTOCONF += --enable-earthmate
else
GPSD_AUTOCONF += --disable-earthmate
endif

ifdef PTXCONF_GPSD_DRIVER_ITRAX
GPSD_AUTOCONF += --enable-itrax
else
GPSD_AUTOCONF += --disable-itrax
endif

ifdef PTXCONF_GPSD_DRIVER_ASHTECH
GPSD_AUTOCONF += --enable-ashtech
else
GPSD_AUTOCONF += --disable-ashtech
endif

ifdef PTXCONF_GPSD_DRIVER_NAVCOM
GPSD_AUTOCONF += --enable-navcom
else
GPSD_AUTOCONF += --disable-navcom
endif

ifdef PTXCONF_GPSD_DRIVER_GARMIN
GPSD_AUTOCONF += --enable-garmin
else
GPSD_AUTOCONF += --disable-garmin
endif

ifdef PTXCONF_GPSD_DRIVER_GARMINTXT
GPSD_AUTOCONF += --enable-garmintxt
else
GPSD_AUTOCONF += --disable-garmintxt
endif

ifdef PTXCONF_GPSD_DRIVER_TNT
GPSD_AUTOCONF += --enable-tnt
else
GPSD_AUTOCONF += --disable-tnt
endif

ifdef PTXCONF_GPSD_DRIVER_UBX
GPSD_AUTOCONF += --enable-ubx
else
GPSD_AUTOCONF += --disable-ubx
endif

ifdef PTXCONF_GPSD_DRIVER_EVERMORE
GPSD_AUTOCONF += --enable-evermore
else
GPSD_AUTOCONF += --disable-evermore
endif

ifdef PTXCONF_GPSD_DRIVER_GPSCLOCK
GPSD_AUTOCONF += --enable-gpsclock
else
GPSD_AUTOCONF += --disable-gpsclock
endif

ifdef PTXCONF_GPSD_DRIVER_RTCM104V2
GPSD_AUTOCONF += --enable-rtcm104v2
else
GPSD_AUTOCONF += --disable-rtcm104v2
endif

ifdef PTXCONF_GPSD_DRIVER_RTCM104V3
GPSD_AUTOCONF += --enable-rtcm104v3
else
GPSD_AUTOCONF += --disable-rtcm104v3
endif

ifdef PTXCONF_GPSD_DRIVER_NTRIP
GPSD_AUTOCONF += --enable-ntrip
else
GPSD_AUTOCONF += --disable-ntrip
endif

ifdef PTXCONF_GPSD_DRIVER_SUPERSTAR2
GPSD_AUTOCONF += --enable-superstar2
else
GPSD_AUTOCONF += --disable-superstar2
endif

ifdef PTXCONF_GPSD_DRIVER_OCEANSERVER
GPSD_AUTOCONF += --enable-oceanserver
else
GPSD_AUTOCONF += --disable-oceanserver
endif

ifdef PTXCONF_GPSD_DRIVER_MKT3301
GPSD_AUTOCONF += --enable-mkt3301
else
GPSD_AUTOCONF += --disable-mkt3301
endif

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/gpsd.compile:
	@$(call targetinfo)
	cd $(GPSD_DIR) && $(GPSD_PATH) $(MAKE) $(PARALLELMFLAGS)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gpsd.targetinstall:
	@$(call targetinfo)

	@$(call install_init, gpsd)
	@$(call install_fixup, gpsd,PACKAGE,gpsd)
	@$(call install_fixup, gpsd,PRIORITY,optional)
	@$(call install_fixup, gpsd,VERSION,$(GPSD_VERSION))
	@$(call install_fixup, gpsd,SECTION,base)
	@$(call install_fixup, gpsd,AUTHOR,"J�rgen Kilb <j.kilb\@phytec.de>")
	@$(call install_fixup, gpsd,DEPENDS,)
	@$(call install_fixup, gpsd,DESCRIPTION,missing)

	@$(call install_copy, gpsd, 0, 0, 0644, \
		$(GPSD_DIR)/.libs/libgps.so.18.0.0, \
		/usr/lib/libgps.so.18.0.0)
	@$(call install_link, gpsd, libgps.so.18.0.0, /usr/lib/libgps.so)
	@$(call install_link, gpsd, libgps.so.18.0.0, /usr/lib/libgps.so.18)

ifdef PTXCONF_GPSD_GPSD
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/gpsd, /usr/sbin/gpsd)
endif
ifdef PTXCONF_GPSD_GPSCTL
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/gpsctl, /usr/bin/gpsctl)
endif
ifdef PTXCONF_GPSD_GPSPIPE
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/gpspipe, /usr/bin/gpspipe)
endif
ifdef PTXCONF_GPSD_GPSFLASH
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/gpsflash, /usr/bin/gpsflash)
endif
ifdef PTXCONF_GPSD_CGXLOGGER
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/cgpxlogger, /usr/bin/cgxlogger)
endif
ifdef PTXCONF_GPSD_CGPS
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/cgps, /usr/bin/cgps)
endif
ifdef PTXCONF_GPSD_GPSMON
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/gpsmon, /usr/bin/gpsmon)
endif
ifdef PTXCONF_GPSD_DRIVER_RTCM104
	@$(call install_copy, gpsd, 0, 0, 0755, $(GPSD_DIR)/rtcmdecode, /usr/bin/rtcmdecode)
endif

	@$(call install_finish, gpsd)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

gpsd_clean:
	rm -rf $(STATEDIR)/gpsd.*
	rm -rf $(PKGDIR)/gpsd_*
	rm -rf $(GPSD_DIR)

# vim: syntax=make
