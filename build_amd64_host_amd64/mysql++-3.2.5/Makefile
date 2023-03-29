PROJECT:=mysql++
SRC_DIR:=$(shell pwd)/../../tar/mysql++-3.2.5
BUILT_DATE:=$(shell date +%Y%m%d)

INSTALL_DIR:=$(shell pwd)/$(PROJECT)-3.2.5


.PHONY:
all: $(PROJECT).configure $(PROJECT).build $(PROJECT).install $(PROJECT).makedeb

build_dir:
	mkdir build_dir



define configure
	cd build_dir && $(SRC_DIR)/configure -v \
				--prefix=$(INSTALL_DIR)/usr/local \
				--with-mysql=/usr/local \
				--with-mysql-include=/usr/local/include \
				--with-mysql-lib=/usr/local/lib64 \
				CXXFLAGS='-O2'

endef

include ../default_configure.mk

define build
	+ cd build_dir && make

endef

include ../default_build.mk

include ../default_install.mk

include ../makedeb.mk

PACKAGE_NAME:=libmysql++-3.2.5-dev
DEB_NAME:=libmysql++-3.2.5-dev_$(ARCHITECTURE).deb
DEB_VERSION:=3.2.4.$(BUILT_DATE)

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
