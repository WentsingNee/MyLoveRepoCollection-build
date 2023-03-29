PROJECT:=json
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_SHORT_ID)


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
					-DJSON_BuildTests=OFF \
					-DJSON_MultipleHeaders=ON \

endef

include ../default_configure.mk

define build
	+ cd build_dir && make

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=libnlohmannjson-trunk-dev
DEB_NAME:=libnlohmannjson-trunk-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
