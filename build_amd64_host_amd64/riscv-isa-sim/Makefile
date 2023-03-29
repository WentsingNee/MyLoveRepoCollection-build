PROJECT:=riscv-isa-sim
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
				--without-debug \
				--without-boost-asio \
				--without-boost-regex \

endef

include ../default_configure.mk

define build
	+ cd build_dir && make \
					CFLAGS='-O3 -march=native' \
					CXXFLAGS='-O3 -march=native'

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=riscv-isa-sim-trunk
DEB_NAME:=riscv-isa-sim-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
