# TODO: Need to setup a proper inheritance tree for this class of
# products...
#
# For now, reuse the generic (phone) infrastructure.
#

PRODUCT_PACKAGES := \
	ConnectBot \
	Email \
	FileManager \
	GlobalTime \
	JETBoy \
	LunarLander \
	NotePad \
	RSSReader \
	Snake

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

PRODUCT_NAME := s5
PRODUCT_DEVICE := s5
PRODUCT_POLICY := android.policy_mid
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dataroaming=true

ifeq ($(TARGET_PRODUCT),$(PRODUCT_NAME))
TARGET_ARCH := x86
DISABLE_DEXPREOPT := true
endif
