PROJECT:=sqlite3pp
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
	

.PHONY:
$(PROJECT).configure: build_dir
	

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	



.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ mkdir -p ./sqlite3pp-trunk-$(GIT_COMMIT_SHORT_ID)/usr/local/include/
	+ cp -r $(SRC_DIR)/headeronly_src/* ./sqlite3pp-trunk-$(GIT_COMMIT_SHORT_ID)/usr/local/include/


include ../makedeb.mk

PACKAGE_NAME:=libsqlite3pp-trunk-dev
DEB_NAME:=libsqlite3pp-trunk-dev_$(GIT_COMMIT_DATE)_$(GIT_COMMIT_SHORT_ID).0_$(ARCHITECTURE).deb
DEB_VERSION:=$(GIT_COMMIT_DATE).$(GIT_COMMIT_TIME)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)
