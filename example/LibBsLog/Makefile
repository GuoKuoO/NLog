CROSS_BUILD =
# CROSS_BUILD = /root/compile/arm-hisiv200-linux
BUILD_DIR = build

.PHONY : debug
debug: 
	@$(CROSS_BUILD) cmake -B$(BUILD_DIR) -H. -DCMAKE_BUILD_TYPE=debug
	@$(CROSS_BUILD) make -C $(BUILD_DIR)

.PHONY : release
release: 
	@$(CROSS_BUILD) cmake -B$(BUILD_DIR) -H. -DCMAKE_BUILD_TYPE=release
	@$(CROSS_BUILD) make -C $(BUILD_DIR)
	

# Clean out the build directory
.PHONY : clean
clean:
	@$(CROSS_BUILD) cmake -B$(BUILD_DIR) -H. -DCMAKE_BUILD_TYPE=clean
	@rm -rf $(BUILD_DIR)/*
