
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
PACKAGE_NAME:=$(PROJECT)-trunk
DEB_NAME:=$(PROJECT)-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)


CONFIGURATION_TYPE:=CONFIGURE

CONFIGURATION_ARGS:= \
		-v \
		--prefix=$(INSTALL_DIR)/usr/local \
		--build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu \
		--program-suffix=-$(GCC_VER) \
		--enable-languages=c,c++ \
		--disable-werror --enable-default-pie \
		--with-system-zlib --with-target-system-zlib=auto \
		--enable-shared --disable-checking --with-abi=m64 \
		--disable-multilib --disable-bootstrap \



MAKE_ARGS:= \
		BOOT_CFLAGS='-O3 -march=native' BOOT_CXXFLAGS='-O3 -march=native' \
		CFLAGS_FOR_TARGET='-O3 -march=native' CXXFLAGS_FOR_TARGET='-O3 -march=native' \
		CFLAGS_FOR_BUILD='-O3 -march=native' CXXFLAGS_FOR_BUILD='-O3 -march=native' \
		CFLAGS='-O3 -march=native' CXXFLAGS='-O3 -march=native' \
		LIBCFLAGS='-O3 -march=native' \


include ../default_clean.mk
include ../default_configure.mk
include ../default_build.mk
include ../default_install.mk
include ../default_all.mk

# requirements:
# flex
# zlib.h -> zlib1g-dev
