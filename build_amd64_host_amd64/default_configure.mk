
define configure.cmake
	mkdir -p $(BUILD_DIR); \
	cd $(BUILD_DIR) && cmake $(CONFIGURATION_ARGS); \
	echo; \
	echo; \
	echo; \

endef

define configure.cmake.dyn
	mkdir -p $(BUILD_DIR)_dyn; \
	cd $(BUILD_DIR)_dyn && cmake $(CONFIGURATION_ARGS.dyn); \
	echo; \
	echo; \
	echo; \

endef

define configure.configure
	mkdir -p $(BUILD_DIR); \
	cd $(BUILD_DIR) && $(SRC_DIR)/configure $(CONFIGURATION_ARGS); \
	echo; \
	echo; \
	echo; \

endef


define configure
	mkdir -p $(WORKING_DIR); \
	workdir=$(shell pwd); \
	echo $$workdir; \
	if [ "$(CONFIGURATION_TYPE)" = "CMAKE" ]; then \
		$(call configure.cmake) \
		if [ "$(BUILD_SHARED_LIBS)" = true ]; then \
			cd $$workdir; \
			$(call configure.cmake.dyn) \
		fi \
	elif [ "$(CONFIGURATION_TYPE)" = "CONFIGURE" ]; then \
		$(call configure.configure) \
	fi
endef


.PHONY:
$(PROJECT).configure:
	$(call configure)
