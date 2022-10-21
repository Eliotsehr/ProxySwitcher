include $(THEOS)/makefiles/common.mk

TOOL_NAME = ProxySwitcherd
ADDITIONAL_OBJCFLAGS = -fobjc-arc
ProxySwitcherd_FILES = $(wildcard *.m *.mm *.x *.xm)
ProxySwitcherd_FRAMEWORKS = UIKit Foundation SystemConfiguration
ProxySwitcherd_INSTALL_PATH = /usr/bin

include $(THEOS_MAKE_PATH)/tool.mk