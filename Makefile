TARGET := iphone:clang:latest:7.0
THEOS_DEVICE_IP = 192.168.0.34
LIBRARY_NAME = CPrefs
SUBPROJECTS += CPrefstest

$(LIBRARY_NAME)_FILES = $(wildcard src/*.m)
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc
$(LIBRARY_NAME)_INSTALL_PATH = /usr/local/lib
$(LIBRARY_NAME)_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

library:
	- make sdk
	- make do

after-stage::
	- find $(THEOS_STAGING_DIR) -name '.gitkeep' -delete
	- mkdir -p $(THEOS_STAGING_DIR)/usr/include/$(LIBRARY_NAME)/
	- cp $(THEOS_PROJECT_DIR)/include/*.h $(THEOS_STAGING_DIR)/usr/include/$(LIBRARY_NAME)/

sdk:
	# Just in case of removing files
	- rm -rf $(THEOS)/include/$(LIBRARY_NAME)/ 
	- mkdir -p $(THEOS)/include/$(LIBRARY_NAME)/
	- cp $(THEOS_PROJECT_DIR)/include/*.h $(THEOS)/include/$(LIBRARY_NAME)/
	- cp $(THEOS_OBJ_DIR)/$(LIBRARY_NAME).dylib $(THEOS)/lib/
	- mkdir -p $(THEOS_PROJECT_DIR)/lib/
	- cp $(THEOS_OBJ_DIR)/$(LIBRARY_NAME).dylib $(THEOS_PROJECT_DIR)/lib/
