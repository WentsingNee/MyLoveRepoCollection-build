
PROJECT:=clang-llvm
SRC_DIR:=$(shell pwd)/../../git/llvm-project

include ../git.mk
include ../makedeb.mk

BUILT_DATE:=$(shell date +%Y%m%d)
WORKING_DIR:=$(shell pwd)/$(PROJECT)-trunk_$(BUILT_DATE)_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID)
BUILD_DIR:=$(WORKING_DIR)/BUILD
INSTALL_DIR:=$(WORKING_DIR)/INSTALL
PACKAGE_DIR:=$(WORKING_DIR)
PACKAGE_NAME:=$(PROJECT)-trunk
DEB_NAME:=$(PROJECT)-trunk_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)


CONFIGURATION_TYPE:=CMAKE

CONFIGURATION_ARGS:= \
		$(SRC_DIR)/llvm \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
		-DBUILD_SHARED_LIBS=True \
		-DCMAKE_CXX_STANDARD=17 \
		-DLLVM_ENABLE_PROJECTS="clang;lld;lldb" \
		-DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind;openmp" \
		-DLLVM_INCLUDE_EXAMPLES=OFF \
		-DLLVM_INCLUDE_TESTS=OFF \
		-DLLVM_INCLUDE_BENCHMARKS=OFF \
		-DLLVM_TARGETS_TO_BUILD="AArch64;ARM;RISCV;X86" \
		-DLLVM_ENABLE_LIBCXX=OFF \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \

#		-DLLVM_ENABLE_LTO=ON \
#		-DCMAKE_C_COMPILER=gcc \
#		-DCMAKE_CXX_COMPILER=g++ \


include ../default_clean.mk
include ../default_configure.mk
include ../cmake_build.mk



define install
#	+ cd $(BUILD_DIR) && make install
	+ cmake --build $(BUILD_DIR) --target install
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

.PHONY:
$(PROJECT).install.dyn.nodep:

.PHONY:
$(PROJECT).install.dyn:


.PHONY:
all: \
		$(PROJECT).configure \
		$(PROJECT).build \
		$(PROJECT).install \
		$(PROJECT).makedeb \
