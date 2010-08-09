LOCAL_PATH := $(call my-dir)
LOCAL_FIRMWARES := 
TARGET_INITRD_SCRIPTS := $(LOCAL_PATH)/s5_info
TARGET_PREBUILT_APPS := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/app/*))
TARGET_KERNEL_CONFIG := $(LOCAL_PATH)/s5_defconfig

#copy firmware files
$(call add-prebuilt-targets,$(TARGET_OUT)/lib/firmware, msvdx_fw.bin)
$(call add-prebuilt-targets,$(TARGET_OUT)/lib/firmware, sd8686.bin)
$(call add-prebuilt-targets,$(TARGET_OUT)/lib/firmware, sd8686_helper.bin)

#copy init shell script
$(call add-prebuilt-targets,$(TARGET_OUT_ETC), init.s5.sh)

#copy alsa configurations
$(call add-prebuilt-targets,$(TARGET_OUT_ETC), asound.conf)

include $(GENERIC_X86_ANDROID_MK)

