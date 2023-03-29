PROJECT:=libstdc++-v3
SRC_DIR:=$(shell pwd)/../../git/gcc
GCC_VER:=$(shell cat $(SRC_DIR)/gcc/BASE-VER)
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_SHORT_ID)


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/libstdc++-v3/configure -v \
				--prefix=$(INSTALL_DIR)/usr/local \
				--build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu \
				--program-suffix=-11.0.0 \
				--disable-werror \
				--enable-shared \
				--disable-multilib

endef

include ../default_configure.mk

define build
	+ cd build_dir && make all \
					CFLAGS='-O3 -flto -march=native' CXXFLAGS='-O3 -nostdinc++ -flto -march=native'

endef

include ../default_build.mk

define install
	 cd build_dir && make install
endef

.PHONY:
$(PROJECT).install.nodep:
	$(call install)

.PHONY:
$(PROJECT).install: $(PROJECT).build
	$(call install)

include ../makedeb.mk

PACKAGE_NAME:=libstdc++-trunk-native-dev
DEB_NAME:=libstdc++-trunk-native-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_amd64.deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
