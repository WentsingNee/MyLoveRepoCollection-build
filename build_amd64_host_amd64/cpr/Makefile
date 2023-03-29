PROJECT:=cpr
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_SHORT_ID)


.PHONY:
all: \
		$(PROJECT).configure \
		$(PROJECT).build \
		$(PROJECT).configure.dyn \
		$(PROJECT).build.dyn \
		$(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir

.PHONY:
$(PROJECT).configure: build_dir
	cd build_dir && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
					-DCURL_INCLUDE_DIR=/usr/include \
					-DCPR_FORCE_USE_SYSTEM_CURL=ON \
					-DCPR_BUILD_TESTS=OFF \
					-DBUILD_SHARED_LIBS=False

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cd build_dir && make



#build_dir_dyn:
#	mkdir build_dir_dyn

#.PHONY:
#$(PROJECT).configure.dyn: build_dir_dyn
#	cd build_dir_dyn && cmake $(SRC_DIR) \
#					-DCMAKE_BUILD_TYPE=Release \
#					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
#					-DCURL_INCLUDE_DIR=/usr/include \
#					-DCPR_FORCE_USE_SYSTEM_CURL=ON \
#					-DCPR_BUILD_TESTS=OFF \
#					-DBUILD_SHARED_LIBS=True

#.PHONY:
#$(PROJECT).build.dyn: $(PROJECT).configure.dyn
#	+ cd build_dir_dyn && make



.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd build_dir && make install
#	+ cd build_dir_dyn && make install


include ../makedeb.mk

PACKAGE_NAME:=libcpr-trunk-dev
DEB_NAME:=libcpr-trunk-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
