PROJECT:=qemu
SRC_DIR:=$(shell pwd)/../../git/qemu
BUILT_DATE:=$(shell date +%Y%m%d)

INSTALL_DIR:=$(shell pwd)/$(PROJECT)


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir


#--target-list=aarch64-softmmu,arm-softmmu,riscv32-softmmu,riscv64-softmmu,x86_64-softmmu,aarch64-linux-user,aarch64_be-linux-user,arm-linux-user,riscv32-linux-user,riscv64-linux-user,x86_64-linux-user \

define configure
	cd build_dir && $(SRC_DIR)/configure \
				--prefix=$(INSTALL_DIR)/usr/local \
				--target-list=aarch64-linux-user,aarch64_be-linux-user,arm-linux-user,riscv32-linux-user,riscv64-linux-user,x86_64-linux-user,loongarch64-linux-user \
				CFLAGS='-O3 -mavx2' CXXFLAGS='-O3 -mavx2' \

endef

include ../default_configure.mk

define build
	+ cd build_dir && make \
					CFLAGS='-O3 -mavx2' CXXFLAGS='-O3 -mavx2' \

endef


include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=qemu
VERSION:=$(shell cat $(SRC_DIR)/VERSION)
DEB_NAME:=qemu_$(VERSION)_$(ARCHITECTURE).deb
DEB_VERSION:=$(VERSION)


.PHONY:
$(PROJECT).makedeb.nodep:
	-rm -rf $(INSTALL_DIR)/usr/local/share/info
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	-rm -rf $(INSTALL_DIR)/usr/local/share/info
	$(call make_deb)
