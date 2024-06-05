
.PHONY:
$(PROJECT).install.nodep:
	+ cmake --build $(BUILD_DIR) --target install

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cmake --build $(BUILD_DIR) --target install

.PHONY:
$(PROJECT).install.dyn.nodep:
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cmake --build $(BUILD_DIR)_dyn --target install
endif

.PHONY:
$(PROJECT).install.dyn: $(PROJECT).install.dyn.nodep
	+ cmake --build $(BUILD_DIR)_dyn --target install
