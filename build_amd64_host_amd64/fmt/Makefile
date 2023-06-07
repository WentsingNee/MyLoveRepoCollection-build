
PROJECT:=fmt
SRC_DIR:=$(shell pwd)/../../git/$(PROJECT)

include ../git.mk
include ../makedeb.mk

BUILT_DATE:=$(shell date +%Y%m%d)
WORKING_DIR:=$(shell pwd)/$(PROJECT)-trunk_$(BUILT_DATE)_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID)
BUILD_DIR:=$(WORKING_DIR)/BUILD
INSTALL_DIR:=$(WORKING_DIR)/INSTALL
PACKAGE_DIR:=$(WORKING_DIR)
PACKAGE_NAME:=lib$(PROJECT)-trunk-dev
DEB_NAME:=lib$(PROJECT)-trunk-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)


CONFIGURATION_TYPE:=CMAKE
BUILD_SHARED_LIBS:=true

BASIC_CONFIGURATION_ARGS:= \
		$(SRC_DIR) \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=$(INSTALL_DIR)/usr/local \
		-DFMT_TEST=OFF \

CONFIGURATION_ARGS:= \
		$(BASIC_CONFIGURATION_ARGS) \
		-DBUILD_SHARED_LIBS=False

CONFIGURATION_ARGS.dyn:= \
		$(BASIC_CONFIGURATION_ARGS) \
		-DBUILD_SHARED_LIBS=True

MAKE_ARGS:= \
		all

MAKE_ARGS.dyn:= \
		all


include ../default_clean.mk
include ../default_configure.mk
include ../default_build.mk
include ../default_install.mk
include ../default_all.mk
