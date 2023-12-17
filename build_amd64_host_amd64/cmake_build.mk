
.PHONY:
$(PROJECT).build.nodep:
	+ cmake --build $(BUILD_DIR) -- $(MAKE_ARGS);

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cmake --build $(BUILD_DIR) -- $(MAKE_ARGS);

.PHONY:
$(PROJECT).build.dyn.nodep:
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cmake --build $(BUILD_DIR)_dyn -- $(MAKE_ARGS);
endif

.PHONY:
$(PROJECT).build.dyn: $(PROJECT).configure
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cmake --build $(BUILD_DIR)_dyn -- $(MAKE_ARGS);
endif
