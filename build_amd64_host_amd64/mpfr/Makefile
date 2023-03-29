PROJECT:=mpfr
SRC_DIR:=$(shell pwd)/../../tar/mpfr-4.0.2
BUILT_DATE:=$(shell date +%Y%m%d)

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-4.0.2


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/configure -v \
				--prefix=$(INSTALL_DIR)/usr/local

endef

include ../default_configure.mk

define build
	+ cd build_dir && make

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=libmpfr-4.0.2-dev
DEB_NAME:=libmpfr-4.0.2-dev_$(ARCHITECTURE).deb
DEB_VERSION:=4.0.2.$(BUILT_DATE)

.PHONY:
$(PROJECT).makedeb.nodep:
	-rm -rf $(INSTALL_DIR)/usr/local/share/info
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	-rm -rf $(INSTALL_DIR)/usr/local/share/info
	$(call make_deb)
