xxxxxxxx=-e=/.,/.,./;';'
PROJECT:=gmp
GMP_VER:=6.1.2
SRC_DIR:=$(shell pwd)/../../tar/$(PROJECT)-$(GMP_VER)

BUILT_DATE:=$(shell date +%Y%m%d)
WORKING_DIR:=$(shell pwd)/$(PROJECT)-$(GMP_VER)_$(BUILT_DATE)
BUILD_DIR:=$(WORKING_DIR)/BUILD
INSTALL_DIR:=$(WORKING_DIR)/INSTALL
PACKAGE_DIR:=$(WORKING_DIR)
PACKAGE_NAME:=lib$(PROJECT)-$(GMP_VER)-dev
DEB_NAME:=lib$(PROJECT)-$(GMP_VER)-dev_$(ARCHITECTURE).deb
DEB_VERSION:=$(GMP_VER).$(BUILT_DATE)

CONFIGURATION_TYPE:=CONFIGURE

CONFIGURATION_ARGS:= \
		-v \
		--prefix=$(INSTALL_DIR)/usr/local \
		--enable-cxx

MAKE_ARGS:= \
		all


include ../default_clean.mk
include ../default_configure.mk
include ../default_build.mk
include ../default_install.mk

.PHONY:
$(PROJECT).makedeb.nodep:
	-rm -rf $(INSTALL_DIR)/usr/local/share/info
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	-rm -rf $(INSTALL_DIR)/usr/local/share/info
	$(call make_deb)
=

include ../default_all.mk
