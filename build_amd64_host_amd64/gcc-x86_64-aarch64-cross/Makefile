
PROJECT:=gcc
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
GCC_VER:=$(shell cat $(SRC_DIR)/gcc/BASE-VER)

include ../git.mk
include ../makedeb.mk

BUILT_DATE:=$(shell date +%Y%m%d)
WORKING_DIR:=$(shell pwd)/$(PROJECT)-trunk_$(BUILT_DATE)_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID)
BUILD_DIR:=$(WORKING_DIR)/BUILD
INSTALL_DIR:=$(WORKING_DIR)/INSTALL
PACKAGE_DIR:=$(WORKING_DIR)
PACKAGE_NAME:=$(PROJECT)-aarch64-trunk
DEB_NAME:=$(PROJECT)-aarch64-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)


CONFIGURATION_TYPE:=CONFIGURE

export CC=/usr/local/bin/gcc
export CXX=/usr/local/bin/g++

CONFIGURATION_ARGS:= \
		-v \
		--prefix=$(INSTALL_DIR)/usr/ \
		--build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=aarch64-linux-gnu \
		--program-prefix=aarch64-linux-gnu- --program-suffix=-$(GCC_VER) \
		--enable-languages=c,c++ \
		--disable-werror --enable-default-pie \
		--with-sysroot=/ --with-headers=/usr/aarch64-linux-gnu/include --with-libs=/usr/aarch64-linux-gnu/lib \
		--with-system-zlib --with-target-system-zlib \
		--enable-shared --disable-checking --disable-multilib \
		--disable-bootstrap \


MAKE_ARGS:= \
		BOOT_CFLAGS='-O3' BOOT_CXXFLAGS='-O3' \
		CFLAGS_FOR_TARGET='-O3' CXXFLAGS_FOR_TARGET='-O3' \
		CFLAGS_FOR_BUILD='-O3' CXXFLAGS_FOR_BUILD='-O3' \
		CFLAGS='-O3' CXXFLAGS='-O3'


include ../default_clean.mk
include ../default_configure.mk
include ../default_build.mk



.PHONY:
$(PROJECT).install.nodep:
	+ cd $(BUILD_DIR) && make install
	mkdir -p $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/aarch64-linux-gnu/lib           $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/aarch64-linux-gnu/sys-include   $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/lib64                           $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/share/info/dir                  $(INSTALL_DIR)_trush

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd $(BUILD_DIR) && make install
	mkdir -p $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/aarch64-linux-gnu/lib           $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/aarch64-linux-gnu/sys-include   $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/lib64                           $(INSTALL_DIR)_trush
	mv $(INSTALL_DIR)/usr/share/info/dir                  $(INSTALL_DIR)_trush

.PHONY:
$(PROJECT).install.dyn.nodep:

.PHONY:
$(PROJECT).install.dyn:


include ../default_all.mk
