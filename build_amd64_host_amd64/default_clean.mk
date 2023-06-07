
.PHONY:
clean:
	-rm -rf $(WORKING_DIR)
	-rm -rf $(BUILD_DIR)
	-rm -rf $(BUILD_DIR)_dyn
	-rm -rf $(INSTALL_DIR)
	-rm -rf ./$(DEB_NAME)
