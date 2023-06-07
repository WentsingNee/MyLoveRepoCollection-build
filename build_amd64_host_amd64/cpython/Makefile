
PROJECT:=cpython
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)

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


CONFIGURATION_TYPE:=CONFIGURE

CONFIGURATION_ARGS:= \
		-v \
		--prefix=$(INSTALL_DIR)/usr/local \
		--enable-shared \
		--enable-optimizations \
		CFLAGS="-DNDEBUG -fwrapv -O3 -march=native -Wall" \
		OPT="-DNDEBUG -fwrapv -O3 -march=native -Wall" \


MAKE_ARGS:= \
		build_all


include ../default_clean.mk
include ../default_configure.mk
include ../default_build.mk
include ../default_install.mk
include ../default_all.mk

#libreadline-dev