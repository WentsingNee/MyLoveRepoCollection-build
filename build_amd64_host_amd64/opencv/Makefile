PROJECT:=opencv
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

.PHONY:
$(PROJECT).configure: build_dir
	cd build_dir && cmake $(SRC_DIR) \
					-DCMAKE_BUILD_TYPE=Release \
					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
                    -DCMAKE_C_COMPILER=/usr/bin/gcc-12 \
                    -DCMAKE_CXX_COMPILER=/usr/bin/g++-12 \
                    -DCMAKE_CXX_STANDARD=14 \
                    -DOPENCV_EXTRA_MODULES_PATH=$(SRC_DIR)/../opencv_contrib/modules \
                    -DWITH_CUDA=ON \
                    -DOPENCV_DNN_CUDA=ON \
                    -DCUDA_ARCH_BIN=7.5 \

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cd build_dir && make



#build_dir_dyn:
#	mkdir build_dir_dyn
#
#.PHONY:
#$(PROJECT).configure.dyn: build_dir_dyn
#	cd build_dir_dyn && cmake $(SRC_DIR) \
#					-DCMAKE_BUILD_TYPE=Release \
#					-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
#					-DBUILD_SHARED_LIBS=True \
#
#.PHONY:
#$(PROJECT).build.dyn: $(PROJECT).configure.dyn
#	+ cd build_dir_dyn && make



.PHONY:
$(PROJECT).install.nodep:
	+ cd build_dir && make install

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd build_dir && make install


include ../makedeb.mk

PACKAGE_NAME:=libopencv-trunk-dev
DEB_NAME:=libopencv-trunk-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_amd64.deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
