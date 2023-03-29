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
				--prefix=$(INSTALL_DIR)/usr/ \
				--build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=riscv-linux-gnu \
				--program-prefix=riscv-linux-gnu- --program-suffix=-$(GCC_VER) \
				--enable-languages=c,c++ \
				--disable-werror --enable-default-pie \
				--with-sysroot=/ --with-headers=/usr/riscv-linux-gnu/include --with-libs=/usr/riscv-linux-gnu/lib \
				--with-system-zlib --with-target-system-zlib \
				--enable-multiarch --with-arch=rv64imafdc --with-abi=lp64d \
				--enable-shared --disable-checking --disable-multilib \
				--disable-bootstrap \


endef

.PHONY:
$(PROJECT).configure.nodep:
	$(call configure)

.PHONY:
$(PROJECT).configure: build_dir
	$(call configure)



define build
	+ cd build_dir && make \
					BOOT_CFLAGS='-O2' BOOT_CXXFLAGS='-O2' \
					CFLAGS_FOR_TARGET='-O2' CXXFLAGS_FOR_TARGET='-O2' \
					CFLAGS_FOR_BUILD='-O2' CXXFLAGS_FOR_BUILD='-O2' \
					CFLAGS='-O2' CXXFLAGS='-O2'

endef

.PHONY:
$(PROJECT).build.nodep:
	$(call build)

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	$(call build)



.PHONY:
$(PROJECT).install.nodep:
	+ cd build_dir && make install
	rm -rf $(INSTALL_DIR)/usr/riscv-linux-gnu/lib
	rm -rf $(INSTALL_DIR)/usr/riscv-linux-gnu/sys-include
	rm -rf $(INSTALL_DIR)/usr/share/info/dir

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd build_dir && make install
	rm -rf $(INSTALL_DIR)/usr/riscv-linux-gnu/lib
	rm -rf $(INSTALL_DIR)/usr/riscv-linux-gnu/sys-include
	rm -rf $(INSTALL_DIR)/usr/share/info/dir


include ../makedeb.mk

PACKAGE_NAME:=gcc-riscv-trunk
DEB_NAME:=gcc-riscv-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
