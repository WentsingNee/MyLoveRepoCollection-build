PROJECT:=gmp
SRC_DIR:=$(shell pwd)/../../tar/gmp-6.1.2
BUILT_DATE:=$(shell date +%Y%m%d)

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-6.1.2


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/configure -v \
				--build=x86_64-linux-gnu --host=aarch64-linux-gnu \
				--prefix=$(INSTALL_DIR)/usr/aarch64-linux-gnu \
				--enable-cxx

endef

include ../default_configure.mk

define build
	+ cd build_dir && make

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=libgmp-6.1.2-dev-aarch64-cross
DEB_NAME:=libgmp-6.1.2-dev-aarch64-cross_$(ARCHITECTURE).deb
DEB_VERSION:=6.1.2.$(BUILT_DATE)

.PHONY:
$(PROJECT).makedeb.nodep:
	+rm -rf $(INSTALL_DIR)/usr/aarch64-linux-gnu/share/info/dir
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	+rm -rf $(INSTALL_DIR)/usr/aarch64-linux-gnu/share/info/dir
	$(call make_deb)
