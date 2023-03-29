PROJECT:=clang-llvm
SRC_DIR:=$(shell pwd)/../../git/llvm-project
BUILT_DATE:=$(shell date +%Y%m%d)

include ../git.mk

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-trunk-$(GIT_COMMIT_SHORT_ID)


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && cmake $(SRC_DIR)/llvm \
						-DCMAKE_BUILD_TYPE=Release \
						-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
						-DBUILD_SHARED_LIBS=True \
						-DCMAKE_CXX_STANDARD=17 \
						-DLLVM_ENABLE_PROJECTS=clang \
						-DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;openmp" \
						-DLLVM_INCLUDE_EXAMPLES=OFF \
						-DLLVM_INCLUDE_TESTS=OFF \
						-DLLVM_INCLUDE_BENCHMARKS=OFF \
						-DLLVM_TARGETS_TO_BUILD="AArch64;ARM;RISCV;WebAssembly;X86" \

						-DCMAKE_C_COMPILER=clang \
						-DCMAKE_CXX_COMPILER=clang++ \
						
#						-DLLVM_ENABLE_LTO=ON \
#						-DCMAKE_C_COMPILER=gcc \
#						-DCMAKE_CXX_COMPILER=g++ \

endef

include ../default_configure.mk

define build
	+ cd build_dir && make

endef

include ../default_build.mk



define install
	+ cd build_dir && make install
	cp ./link/aarch64-linux-gnu-clang++ $(INSTALL_DIR)/usr/local/bin/aarch64-linux-gnu-clang++
	chmod +x $(INSTALL_DIR)/usr/local/bin/aarch64-linux-gnu-clang++
	cp ./link/arm-linux-gnueabihf-clang++ $(INSTALL_DIR)/usr/local/bin/arm-linux-gnueabihf-clang++
	chmod +x $(INSTALL_DIR)/usr/local/bin/arm-linux-gnueabihf-clang++

endef

.PHONY:
$(PROJECT).install.nodep:
	$(call install)

.PHONY:
$(PROJECT).install: $(PROJECT).build
	$(call install)


include ../makedeb.mk

PACKAGE_NAME:=clang-llvm-trunk
DEB_NAME:=clang-llvm-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
