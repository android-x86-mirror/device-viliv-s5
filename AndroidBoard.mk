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

#compile and add psb modules
#this is not an Android Makefile format :(
#ToDo : need to find a way to configure the path -_-;;
KBUILD_OUTPUT := $(CURDIR)/$(TARGET_OUT_INTERMEDIATES)/kernel
PSB_SRC_DIR := psb-android
$(LOCAL_PATH)/drm-psb.ko : kernel $(LOCAL_PATH)/psb.ko
	cp $(TARGET_DEVICE_DIR)/$(PSB_SRC_DIR)/drm-psb.ko $(TARGET_DEVICE_DIR)


$(LOCAL_PATH)/psb.ko : kernel
	$(hide) $(MAKE) -C$(TARGET_DEVICE_DIR)/$(PSB_SRC_DIR) \
		LINUXDIR=$(KBUILD_OUTPUT) DRM_MODULES=psb
	cp $(TARGET_DEVICE_DIR)/$(PSB_SRC_DIR)/psb.ko $(TARGET_DEVICE_DIR)

$(call add-prebuilt-targets,$(TARGET_OUT)/lib/modules, drm-psb.ko)
$(call add-prebuilt-targets,$(TARGET_OUT)/lib/modules, psb.ko)

include $(GENERIC_X86_ANDROID_MK)

