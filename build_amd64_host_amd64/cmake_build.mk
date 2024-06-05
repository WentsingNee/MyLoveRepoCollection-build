
.PHONY:
$(PROJECT).build.nodep:
	+ cmake --build $(BUILD_DIR)

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cmake --build $(BUILD_DIR)

.PHONY:
$(PROJECT).build.dyn.nodep:
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cmake --build $(BUILD_DIR)
endif

.PHONY:
$(PROJECT).build.dyn: $(PROJECT).configure
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cmake --build $(BUILD_DIR)
endif
