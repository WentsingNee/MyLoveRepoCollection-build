PROJECT:=mysql-server
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_ID)

.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir


.PHONY:
$(PROJECT).configure: build_dir
	cd build_dir && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
					-DWITH_BOOST=../mysql-boost \
					-DBUILD_SHARED_LIBS=True \
					-DWITH_LTO=ON \
					-DWITH_SSL=yes \
					-DWITH_UNIT_TESTS=OFF \

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=mysql-server-trunk
DEB_NAME:=mysql-server-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)


.PHONY:
$(PROJECT).download_boost:
	cmake $(SRC_DIR) \
					-DDOWNLOAD_BOOST=1 \
					-DWITH_BOOST=./mysql-boost
	
