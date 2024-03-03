# SPDX-FileCopyrightText: 2024 Stijn Tintel <stijn@linux-ipv6.be>
# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=chirpstack-concentratord
PKG_VERSION:=4.3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/chirpstack/chirpstack-concentratord/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=9651b785d703dbc331344e68244793c207b2f895285d19487f408931758ecd7f

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Stijn Tintel

PKG_BUILD_DEPENDS:=rust/host sx1302_hal
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include ../../lang/rust/rust-package.mk

define Package/chirpstack-concentratord-sx1302
  $(call Package/chirpstack-concentratord/Default)
  CATEGORY:=Network
  SECTION:=net
  TITLE:=chirpstack-concentratord-sx1302
  DEPENDS:=$(RUST_ARCH_DEPENDS) +libstdcpp
  URL:=https://github.com/chirpstack/chirpstack-concentratord
endef

define Package/chirpstack-concentratord-sx1302/description
  Concentrator HAL daemon for SX1302-based LoRa gateways.
endef

CARGO_PKG_VARS += \
	STAGING_DIR=$(STAGING_DIR)

define Build/Compile
	$(call Build/Compile/Cargo,chirpstack-concentratord-sx1302)
endef

$(eval $(call RustBinPackage,chirpstack-concentratord-sx1302))
$(eval $(call BuildPackage,chirpstack-concentratord-sx1302))
