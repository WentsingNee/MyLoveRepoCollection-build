PROJECT:=Catch2
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_SHORT_ID)


.PHONY:
all: \
		$(PROJECT).configure \
		$(PROJECT).build \
		$(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir
	mkdir build_dir_dyn

.PHONY:
$(PROJECT).configure: build_dir
	cd build_dir && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
					-DCATCH_BUILD_TESTING=OFF \
					-DCATCH_BUILD_STATIC_LIBRARY=ON \


.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cd build_dir && make

.PHONY:
$(PROJECT).configure_dyn: build_dir
	cd build_dir_dyn && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
					-DCATCH_BUILD_TESTING=OFF \
					-DCATCH_BUILD_STATIC_LIBRARY=OFF \
					-DBUILD_SHARED_LIBS=True \


.PHONY:
$(PROJECT).build_dyn: $(PROJECT).configure_dyn
	+ cd build_dir_dyn && make




.PHONY:
$(PROJECT).install: $(PROJECT).build $(PROJECT).build_dyn
	+ cd build_dir && make install
	+ cd build_dir_dyn && make install


include ../makedeb.mk

PACKAGE_NAME:=libcatch2-trunk-dev
DEB_NAME:=libcatch2-trunk-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
