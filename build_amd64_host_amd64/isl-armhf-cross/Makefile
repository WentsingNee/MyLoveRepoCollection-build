PROJECT:=isl
SRC_DIR:=$(shell pwd)/../../tar/isl-0.18
BUILT_DATE:=$(shell date +%Y%m%d)

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-0.18


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/configure -v \
				--build=x86_64-linux-gnu --host=arm-linux-gnueabihf \
				--prefix=$(INSTALL_DIR)/usr/arm-linux-gnueabihf \
				--enable-shared

endef

include ../default_configure.mk

define build
	+ cd build_dir && make \
					BOOT_CFLAGS='-O2' BOOT_CXXFLAGS='-O2' \
					CFLAGS_FOR_TARGET='-O2' CXXFLAGS_FOR_TARGET='-O2' \
					CFLAGS_FOR_BUILD='-O2' CXXFLAGS_FOR_BUILD='-O2' \
					CFLAGS='-O2' CXXFLAGS='-O2'

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=libisl-0.18-dev-armhf-cross
DEB_NAME:=libisl-0.18-dev-armhf-cross_$(ARCHITECTURE).deb
DEB_VERSION:=0.18.$(BUILT_DATE)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
