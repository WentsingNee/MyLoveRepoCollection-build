
.PHONY:
$(PROJECT).install.nodep:
	+ cd $(BUILD_DIR) && make install

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd $(BUILD_DIR) && make install

.PHONY:
$(PROJECT).install.dyn.nodep:
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cd $(BUILD_DIR)_dyn && make install
endif

.PHONY:
$(PROJECT).install.dyn: $(PROJECT).install.dyn.nodep

