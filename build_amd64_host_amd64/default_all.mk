
ifeq ($(BUILD_SHARED_LIBS), true)
.PHONY:
all: \
		$(PROJECT).configure \
		$(PROJECT).build \
		$(PROJECT).build.dyn \
		$(PROJECT).install \
		$(PROJECT).install.dyn \
		$(PROJECT).makedeb
else
.PHONY:
all: \
		$(PROJECT).configure \
		$(PROJECT).build \
		$(PROJECT).install \
		$(PROJECT).makedeb
endif
