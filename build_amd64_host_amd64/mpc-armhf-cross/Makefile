PROJECT:=mpc
SRC_DIR:=$(shell pwd)/../../tar/mpc-1.1.0
BUILT_DATE:=$(shell date +%Y%m%d)

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-1.1.0


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/configure -v \
				--build=x86_64-linux-gnu --host=arm-linux-gnueabihf \
				--prefix=$(INSTALL_DIR)/usr/arm-linux-gnueabihf \
				CFLAGS='-O2' CXXFLAGS='-O2'

endef

include ../default_configure.mk

define build
	+ cd build_dir && make

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=libmpc-1.1.0-dev-armhf-cross
DEB_NAME:=libmpc-1.1.0-dev-armhf-cross_$(ARCHITECTURE).deb
DEB_VERSION:=1.1.0.$(BUILT_DATE)

.PHONY:
$(PROJECT).makedeb.nodep:
	+rm -rf $(INSTALL_DIR)/usr/arm-linux-gnueabihf/share/info/dir
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	+rm -rf $(INSTALL_DIR)/usr/arm-linux-gnueabihf/share/info/dir
	$(call make_deb)
