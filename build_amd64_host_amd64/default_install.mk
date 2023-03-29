.PHONY:
$(PROJECT).install.nodep:
	+ cd build_dir && make install

.PHONY:
$(PROJECT).install: $(PROJECT).build
	+ cd build_dir && make install
