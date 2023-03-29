PROJECT:=gcc
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
GCC_VER:=$(shell cat $(SRC_DIR)/gcc/BASE-VER)
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_SHORT_ID)


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/configure -v \
				--prefix=$(INSTALL_DIR)/usr/local \
				--build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu \
				--program-suffix=-$(GCC_VER) \
				--enable-languages=c,c++ \
				--disable-werror --enable-default-pie \
				--with-system-zlib --with-target-system-zlib=auto \
				--enable-shared --disable-checking --with-abi=m64 \
				--disable-multilib --disable-bootstrap

endef

include ../default_configure.mk

define build
	+ cd build_dir && make \
					BOOT_CFLAGS='-O3 -march=native' BOOT_CXXFLAGS='-O3 -march=native' \
					CFLAGS_FOR_TARGET='-O3 -march=native' CXXFLAGS_FOR_TARGET='-O3 -march=native' \
					CFLAGS_FOR_BUILD='-O3 -march=native' CXXFLAGS_FOR_BUILD='-O3 -march=native' \
					CFLAGS='-O3 -march=native' CXXFLAGS='-O3 -march=native' \
					LIBCFLAGS='-O3 -march=native'

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=gcc-trunk
DEB_NAME:=gcc-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
