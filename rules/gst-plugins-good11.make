# -*-makefile-*-
#
# Copyright (C) 2008 by Robert Schwebel
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_GST_PLUGINS_GOOD11) += gst-plugins-good11

#
# Paths and names
#
GST_PLUGINS_GOOD11_VERSION	:= 0.11.2
GST_PLUGINS_GOOD11_MD5		:= 56a8f48b11478ea75b1d9e5323e156f4
GST_PLUGINS_GOOD11		:= gst-plugins-good-$(GST_PLUGINS_GOOD11_VERSION)
GST_PLUGINS_GOOD11_SUFFIX	:= tar.bz2
GST_PLUGINS_GOOD11_URL		:= http://gstreamer.freedesktop.org/src/gst-plugins-good/$(GST_PLUGINS_GOOD11).$(GST_PLUGINS_GOOD11_SUFFIX)
GST_PLUGINS_GOOD11_SOURCE	:= $(SRCDIR)/$(GST_PLUGINS_GOOD11).$(GST_PLUGINS_GOOD11_SUFFIX)
GST_PLUGINS_GOOD11_DIR		:= $(BUILDDIR)/$(GST_PLUGINS_GOOD11)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_ALPHA)		+= alpha
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_ALPHA)		+= alpha alphacolor
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_APETAG)		+= apetag
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_AUDIOFX)		+= audiofx
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_AUDIOPARSERS)	+= audioparsers
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_AUPARSE)		+= auparse
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_AUTODETECT)	+= autodetect
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_AVI)		+= avi
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_CUTTER)		+= cutter
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_DEBUGUTILS)	+= debugutils
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_DEBUGUTILS)	+= debug navigationtest
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_DEINTERLACE)	+= deinterlace
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_EFFECTV)		+= effectv
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_EQUALIZER)	+= equalizer
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_FLV)		+= flv
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_FLX)		+= flx
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_FLX)		+= flxdec
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_GOOM)		+= goom
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_GOOM2K1)		+= goom2k1
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_ID3DEMUX)	+= id3demux
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_ICYDEMUX)	+= icydemux
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_IMAGEFREEZE)	+= imagefreeze
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_INTERLEAVE)	+= interleave
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_LAW)		+= law
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_LAW)		+= alaw mulaw
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_LEVEL)		+= level
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_MATROSKA)	+= matroska
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_MONOSCOPE)	+= monoscope
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_MULTIFILE)	+= multifile
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_MULTIPART)	+= multipart
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_QTDEMUX)		+= isomp4
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_REPLAYGAIN)	+= replaygain
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_RTP)		+= rtp
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_RTPMANAGER)	+= rtpmanager
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_RTSP)		+= rtsp
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_SHAPEWIPE)	+= shapewipe
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_SMPTE)		+= smpte
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_SPECTRUM)	+= spectrum
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_UDP)		+= udp
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_VIDEOBOX)	+= videobox
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_VIDEOCROP)	+= videocrop
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_VIDEOFILTER)	+= videofilter
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_VIDEOMIXER)	+= videomixer
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_WAVENC)		+= wavenc
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_WAVPARSE)	+= wavparse
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_Y4M)		+= y4m
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_Y4M)		+= y4menc
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_OSS)		+= oss
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_OSS)		+= ossaudio
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_OSS4)		+= oss4
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_OSS4)		+= oss4audio
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_SUNAUDIO)	+= sunaudio
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_OSX_AUDIO)	+= osx_audio
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_OSX_VIDEO)	+= osx_video
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_GST_V4L2)	+= gst_v4l2
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_GST_V4L2)	+= video4linux2
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_X)		+= x
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_X)		+= ximagesrc
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_XSHM)		+= xshm
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_XVIDEO)		+= xvideo
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_AALIB)		+= aalib
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_ANNODEX)		+= annodex
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_CAIRO)		+= cairo
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_FLAC)		+= flac
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_GDK_PIXBUF)	+= gdk_pixbuf
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_GDK_PIXBUF)	+= gdkpixbuf
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_JPEG)		+= jpeg
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_JACK)		+= jack
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_LIBCACA)	+= libcaca
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_LIBCACA)	+= cacasink
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_LIBDV)		+= libdv
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_LIBPNG)		+= libpng
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_LIBPNG)		+= png
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_PULSE)		+= pulse
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_DV1394)		+= dv1394
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_SHOUT2)		+= shout2
GST_PLUGINS_GOOD11_ENABLEC-$(PTXCONF_GST_PLUGINS_GOOD11_SOUP)		+= soup
GST_PLUGINS_GOOD11_ENABLEP-$(PTXCONF_GST_PLUGINS_GOOD11_SOUP)		+= souphttpsrc
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_SPEEX)		+= speex
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_TAGLIB)		+= taglib
GST_PLUGINS_GOOD11_ENABLE-$(PTXCONF_GST_PLUGINS_GOOD11_WAVPACK)		+= wavpack

GST_PLUGINS_GOOD11_ENABLEC-y	+= $(GST_PLUGINS_GOOD11_ENABLE-y)
GST_PLUGINS_GOOD11_ENABLEC-	+= $(GST_PLUGINS_GOOD11_ENABLE-)
GST_PLUGINS_GOOD11_ENABLEP-y	+= $(GST_PLUGINS_GOOD11_ENABLE-y)

# for new linux/videodev2.h from kernel headers
GST_PLUGINS_GOOD11_CONF_ENV := \
	$(CROSS_ENV) \
	CPPFLAGS="$(CROSS_CPPFLAGS) -I$(KERNEL_HEADERS_INCLUDE_DIR)"

#
# autoconf
#
GST_PLUGINS_GOOD11_CONF_TOOL	:= autoconf
GST_PLUGINS_GOOD11_CONF_OPT	= \
	$(CROSS_AUTOCONF_USR) \
	$(GSTREAMER_GENERIC_CONF_OPT) \
	--enable-external \
	--enable-experimental \
	--disable-directsound \
	--disable-waveform \
	--disable-aalibtest \
	--$(call ptx/endis,PTXCONF_GST_PLUGINS_GOOD11_ZLIB)-zlib \
	--$(call ptx/endis,PTXCONF_GST_PLUGINS_GOOD11_BZ2)-bz2 \
	--$(call ptx/wwo,PTXCONF_GST_PLUGINS_GOOD11_GST_V4L2)-gudev \
	--$(call ptx/wwo,PTXCONF_GST_PLUGINS_GOOD11_GST_V4L2_LIBV4L2)-libv4l2

#
# the --with-plugins sadly only applies to depencyless plugings
# and when no plugins are sellected it builds them all. So
# --with-plugins is useless, so we generate a --enable-*
# and --disable-* below
#
ifneq ($(call remove_quotes,$(GST_PLUGINS_GOOD11_ENABLEC-y)),)
GST_PLUGINS_GOOD11_CONF_OPT +=  --enable-$(subst $(space),$(space)--enable-,$(strip $(GST_PLUGINS_GOOD11_ENABLEC-y)))
endif

ifneq ($(call remove_quotes,$(GST_PLUGINS_GOOD11_ENABLEC-)),)
GST_PLUGINS_GOOD11_CONF_OPT +=  --disable-$(subst $(space),$(space)--disable-,$(strip $(GST_PLUGINS_GOOD11_ENABLEC-)))
endif

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gst-plugins-good11.targetinstall:
	@$(call targetinfo)

	@$(call install_init, gst-plugins-good11)
	@$(call install_fixup, gst-plugins-good11,PRIORITY,optional)
	@$(call install_fixup, gst-plugins-good11,SECTION,base)
	@$(call install_fixup, gst-plugins-good11,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, gst-plugins-good11,DESCRIPTION,missing)

	@for plugin in $(GST_PLUGINS_GOOD11_ENABLEP-y); do \
		$(call install_copy, gst-plugins-good11, 0, 0, 0644, -, \
			/usr/lib/gstreamer-0.11/libgst$${plugin}.so); \
	done

	@$(call install_finish, gst-plugins-good11)

	@$(call touch)

# vim: syntax=make
