#
# Copyright (C) 2017  Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=MySensors
PKG_VERSION:=2.1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=dcc9974a98a622e9b3e7b2dac519a2ee07ce25b1201dddd2305aec08bb511503
PKG_SOURCE_URL:=https://github.com/mysensors/MySensors/archive/$(PKG_VERSION)/2.1.1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/mysgw
  SECTION:=Utils
  CATEGORY:=Utilities
  TITLE:=MySensors Gateway
  URL:=https://www.mysensors.org/
  MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
  DEPENDS:=+libstdcpp
endef

define Package/mysgw/description
endef

CONFIGURE_ARGS += \
	--my-config-file=/var/lib/mysensors/mysensors.dat \
	--my-transport=none

define Build/Install
        $(call Build/Install/Default,install-gateway)
endef

define Package/mysgw/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/bin
	$(INSTALL_BIN) ./files/mysgw.init $(1)/etc/init.d/mysgw
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mysgw $(1)/usr/bin
endef

define Package/mysgw/conffiles
/var/lib/mysensors/
endef

$(eval $(call BuildPackage,mysgw))
