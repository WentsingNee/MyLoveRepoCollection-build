PROJECT:=Linq
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)
BUILT_DATE:=$(shell date +%Y%m%d)
GIT_COMMIT_ID:=$(shell cd $(SRC_DIR) && git rev-parse HEAD)
INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_ID)
DEB_NAME:=libLinq-trunk-dev

.PHONY:
all: \
		$(PROJECT).configure \
		$(PROJECT).build \
		$(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir

.PHONY:
$(PROJECT).configure: build_dir
	cd build_dir && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
					-DBUILD_TESTING=OFF \

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cd build_dir && make

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd build_dir && make install


include ../make_deb.mk

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
