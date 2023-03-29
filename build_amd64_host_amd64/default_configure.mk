.PHONY:
$(PROJECT).configure.nodep:
	$(call configure)

.PHONY:
$(PROJECT).configure: build_dir
	$(call configure)
