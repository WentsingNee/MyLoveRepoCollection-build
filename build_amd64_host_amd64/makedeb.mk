include ../architecture.mk

define make_deb
	cd $(INSTALL_DIR) && mkdir -p ./DEBIAN
	echo "Package: $(PACKAGE_NAME)\
		\nVersion: $(DEB_VERSION)\
		\nArchitecture: $(ARCHITECTURE)\
		\nMaintainer: Peter Nee\
		\nInstalled-Size: $(shell du -s $(INSTALL_DIR)/usr | awk '{print $$1}')\
		\nPriority: extra\
		\nDescription: Version: $(DEB_VERSION)\
		\n             built-date: $(BUILT_DATE)\
		\n             git-commit-id: $(GIT_COMMIT_ID)\
		\n             git-commit-time: $(GIT_COMMIT_DATE) $(GIT_COMMIT_TIME)"\
	 > $(INSTALL_DIR)/DEBIAN/control
	chmod 755 $(INSTALL_DIR)/DEBIAN/control

	dpkg-deb -b -Zxz -z9 $(INSTALL_DIR) $(PACKAGE_DIR)/$(DEB_NAME)
endef

.PHONY:
$(PROJECT).makedeb.nodep:
	$(call make_deb)


ifeq ($(BUILD_SHARED_LIBS), true)

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install $(PROJECT).install.dyn
	$(call make_deb)

else

.PHONY:
$(PROJECT).makedeb: $(PROJECT).install
	$(call make_deb)

endif