#
# Copyright (C) 2017 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vallumd
#PKG_VERSION:=0.2.2
#PKG_RELEASE:=1

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=https://codeberg.org/stintel/vallumd/archive/$(PKG_VERSION).tar.gz?
#PKG_HASH:=f88cafce41cc118862869268b5e6c9b315a6f084aa8a498d4484e9dac49c575c
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://codeberg.org/stintel/vallumd.git
PKG_SOURCE_DATE:=2022-12-15
PKG_SOURCE_VERSION:=e67298d0a530722f9addb76627d58ead9aba6ac0
PKG_MIRROR_HASH:=d2cadd4e9e77d2a572f6e8f4392e87b2e398253f106155b3ce4a2537d3de82ed

PKG_MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DCMAKE_BUILD_TYPE=Release \
	-DUSE_BACKEND=nftables

define Package/vallumd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Centralized or distributed blacklist
  DEPENDS:=+ca-bundle +libnftnl +libmosquitto +libopenssl
endef

define Package/vallumd/description
  Centralized or distributed blacklist
endef

define Package/vallumd/conffiles
/etc/config/vallumd
endef

define Package/vallumd/install
	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d $(1)/usr/sbin
	$(INSTALL_CONF) ./files/vallumd.conf $(1)/etc/config/vallumd
	$(INSTALL_BIN) ./files/vallumd.init $(1)/etc/init.d/vallumd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/vallumd $(1)/usr/sbin/vallumd
endef


$(eval $(call BuildPackage,vallumd))
