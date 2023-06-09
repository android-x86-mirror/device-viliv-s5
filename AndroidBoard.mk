LOCAL_PATH := $(call my-dir)

####################################################################

# When adding GL support, will have to specify this?
#-include vendor/intel/g945/Android.mk

# include more board specific stuff here? Audio params?! <shrug>


####################################################################
### Include input devices specific files

define add-prebuilt-target

file := $(1)/$(2)
$$(file): $$(LOCAL_PATH)/$(2) | $$(ACP)
	$$(transform-prebuilt-to-target)
ALL_PREBUILT += $$(file)

endef

TARGET_KERNEL_CONFIG := $(LOCAL_PATH)/s5_defconfig

define add-keymap

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(1)
include $(BUILD_KEY_CHAR_MAP)

$$(eval $$(call add-prebuilt-target,$(TARGET_OUT_KEYLAYOUT),$$(subst .kcm,.kl,$(1))))

endef

$(eval $(call add-prebuilt-target,$(TARGET_ROOT_OUT),init.rc))
$(INSTALLED_RAMDISK_TARGET): $(file)
$(eval $(call add-prebuilt-target,$(TARGET_ROOT_OUT),init.s5.rc))
$(INSTALLED_RAMDISK_TARGET): $(file)
$(eval $(call add-prebuilt-target,$(TARGET_OUT_DATA_ETC),init.s5.sh))
$(eval $(call add-prebuilt-target,$(TARGET_OUT_DATA_ETC),pointercal))
$(eval $(call add-prebuilt-target,$(TARGET_OUT_DATA_ETC),ts.conf))
$(eval $(call add-prebuilt-target,$(TARGET_OUT_DATA_ETC),ts.env))
$(eval $(call add-prebuilt-target,$(TARGET_OUT_DATA_ETC),ins_pointercal.sh))
$(eval $(call add-prebuilt-target,$(TARGET_OUT_DATA_ETC),asound.conf))

ALL_FIRMWARES := $(shell cd $(LOCAL_PATH) && find firmware -type f)
$(eval $(foreach f,$(ALL_FIRMWARES),$(call add-prebuilt-target,$(TARGET_OUT_SHARED_LIBRARIES),$(f))))

ALL_APPS := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/app/*))
$(eval $(foreach f,$(ALL_APPS),$(call add-prebuilt-target,$(TARGET_OUT),$(f))))

LOCAL_PATH := $(LOCAL_PATH)/keymaps
ALL_KEYMAPS := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/*.kcm))
$(eval $(foreach f,$(ALL_KEYMAPS),$(call add-keymap,$(f))))
