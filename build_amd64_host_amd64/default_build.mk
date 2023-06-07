
.PHONY:
$(PROJECT).build.nodep:
	+ cd $(BUILD_DIR) && make $(MAKE_ARGS)

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	+ cd $(BUILD_DIR) && make $(MAKE_ARGS)

.PHONY:
$(PROJECT).build.dyn.nodep:
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cd $(BUILD_DIR)_dyn && make $(MAKE_ARGS)
endif

.PHONY:
$(PROJECT).build.dyn: $(PROJECT).configure
ifeq ($(BUILD_SHARED_LIBS), true)
	+ cd $(BUILD_DIR)_dyn && make $(MAKE_ARGS)
endif
