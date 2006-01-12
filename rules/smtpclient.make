# -*-makefile-*-
# $Id:$
#
# Copyright (C) 2005 by Robert Schwebel
#          
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_SMTPCLIENT) += smtpclient

#
# Paths and names
#
SMTPCLIENT_VERSION	= 1.0.0
SMTPCLIENT		= smtpclient-$(SMTPCLIENT_VERSION)
SMTPCLIENT_SUFFIX	= tar.gz
SMTPCLIENT_URL		= http://www.pengutronix.de/software/ptxdist/temporary-src/$(SMTPCLIENT).$(SMTPCLIENT_SUFFIX)
SMTPCLIENT_SOURCE	= $(SRCDIR)/$(SMTPCLIENT).$(SMTPCLIENT_SUFFIX)
SMTPCLIENT_DIR		= $(BUILDDIR)/$(SMTPCLIENT)

-include $(call package_depfile)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

smtpclient_get: $(STATEDIR)/smtpclient.get

$(STATEDIR)/smtpclient.get: $(SMTPCLIENT_SOURCE)
	@$(call targetinfo, $@)
	@$(call get_patches, $(SMTPCLIENT))
	@$(call touch, $@)

$(SMTPCLIENT_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(SMTPCLIENT_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

smtpclient_extract: $(STATEDIR)/smtpclient.extract

$(STATEDIR)/smtpclient.extract: $(smtpclient_extract_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(SMTPCLIENT_DIR))
	@$(call extract, $(SMTPCLIENT_SOURCE))
	@$(call patchin, $(SMTPCLIENT))
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

smtpclient_prepare: $(STATEDIR)/smtpclient.prepare

SMTPCLIENT_PATH	=  PATH=$(CROSS_PATH)
SMTPCLIENT_ENV 	=  $(CROSS_ENV)

#
# autoconf
#
SMTPCLIENT_AUTOCONF =  $(CROSS_AUTOCONF_USR)

$(STATEDIR)/smtpclient.prepare: $(smtpclient_prepare_deps_default)
	@$(call targetinfo, $@)
	@$(call clean, $(SMTPCLIENT_DIR)/config.cache)
	cd $(SMTPCLIENT_DIR) && \
		$(SMTPCLIENT_PATH) $(SMTPCLIENT_ENV) \
		./configure $(SMTPCLIENT_AUTOCONF)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

smtpclient_compile: $(STATEDIR)/smtpclient.compile

$(STATEDIR)/smtpclient.compile: $(smtpclient_compile_deps_default)
	@$(call targetinfo, $@)
	cd $(SMTPCLIENT_DIR) && $(SMTPCLIENT_ENV) $(SMTPCLIENT_PATH) make
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

smtpclient_install: $(STATEDIR)/smtpclient.install

$(STATEDIR)/smtpclient.install: $(STATEDIR)/smtpclient.compile
	@$(call targetinfo, $@)
	@$(call install, SMTPCLIENT)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

smtpclient_targetinstall: $(STATEDIR)/smtpclient.targetinstall

$(STATEDIR)/smtpclient.targetinstall: $(smtpclient_targetinstall_deps_default)
	@$(call targetinfo, $@)
	
	@$(call install_init,default)
	@$(call install_fixup,PACKAGE,smtpclient)
	@$(call install_fixup,PRIORITY,optional)
	@$(call install_fixup,VERSION,$(SMTPCLIENT_VERSION))
	@$(call install_fixup,SECTION,base)
	@$(call install_fixup,AUTHOR,"Robert Schwebel <r.schwebel\@pengutronix.de>")
	@$(call install_fixup,DEPENDS,)
	@$(call install_fixup,DESCRIPTION,missing)

	@$(call install_copy, 0, 0, 0755, $(SMTPCLIENT_DIR)/smtpclient, /usr/bin/smtpclient)

	@$(call install_finish)

	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

smtpclient_clean:
	rm -rf $(STATEDIR)/smtpclient.*
	rm -rf $(IMAGEDIR)/smtpclient_*
	rm -rf $(SMTPCLIENT_DIR)

# vim: syntax=make
