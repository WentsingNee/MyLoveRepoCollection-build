
dirs = $(shell ls -F | grep '/$$')

.PHONY:
all: $(dirs).build

.PHONY: $(dirs).build
$(dirs).build:
	+cd $@ && make all
	@echo
	@echo
