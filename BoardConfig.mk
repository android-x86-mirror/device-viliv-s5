TARGET_HAS_THIRD_PARTY_APPS := true
BOARD_WPA_SUPPLICANT_DRIVER := true
BOARD_USES_TSLIB := true
BOARD_DISABLE_PM := true
TARGET_GLOBAL_CFLAGS += -O2 -mhard-float -march=i586 -mmmx -msse -msse2 -msse3 -mfpmath=sse
TARGET_GLOBAL_CPPFLAGS += -O2 -mhard-float -march=i586 -mmmx -msse -msse2 -msse3 -mfpmath=sse

include $(GENERIC_X86_CONFIG_MK)

