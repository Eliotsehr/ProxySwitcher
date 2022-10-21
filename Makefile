TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

ADDITIONAL_OBJCFLAGS = -fobjc-arc
TWEAK_NAME = ProxySwitcher
ProxySwitcher_FILES = $(wildcard *.m *.mm *.x *.xm)
ProxySwitcher_FRAMEWORKS = UIKit Foundation SystemConfiguration

BUNDLE_NAME = ProxySwitcherBundle
ProxySwitcherBundle_INSTALL_PATH = /Library/Application Support/ProxySwitcher

include $(THEOS_MAKE_PATH)/tweak.mk


SUBPROJECTS += proxyswitcherprefs
SUBPROJECTS += proxyswitcherd
SUBPROJECTS += proxyswitcheruikit
include $(THEOS_MAKE_PATH)/aggregate.mk
include $(THEOS)/makefiles/bundle.mk
