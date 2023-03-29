.PHONY:
$(PROJECT).build.nodep:
	$(call build)

.PHONY:
$(PROJECT).build: $(PROJECT).configure
	$(call build)

