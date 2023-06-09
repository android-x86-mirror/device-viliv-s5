# These definitions override the defaults in config/config.make.
TARGET_CPU_ABI := x86

TARGET_COMPRESS_MODULE_SYMBOLS := false

TARGET_PRELINK_MODULE := false

TARGET_NO_BOOTLOADER := true

TARGET_NO_RECOVERY := true

#TARGET_NO_KERNEL := true

TARGET_HARDWARE_3D := false

BOARD_USES_TSLIB := true

BOARD_USES_GENERIC_AUDIO := false

BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

BOARD_HAVE_BLUETOOTH := true

TARGET_PROVIDES_INIT_RC := true

USE_CUSTOM_RUNTIME_HEAP_MAX := "128M"

TARGET_USERIMAGES_USE_EXT2 := true
TARGET_BOOTIMAGE_USE_EXT2 := true
TARGET_USE_DISKINSTALLER := true

LOCAL_PATH := $(call my-dir)
TARGET_DISK_LAYOUT_CONFIG := $(LOCAL_PATH)/disk_layout.conf

BOARD_KERNEL_CMDLINE := root=/dev/ram0 androidboot_hardware=s5 acpi_sleep=s3_bios,s3_mode


BOARD_BOOTIMAGE_MAX_SIZE := 8388608
BOARD_SYSLOADER_MAX_SIZE := 7340032
BOARD_FLASH_BLOCK_SIZE := 512

#okkwon : need to adjust -_-?
BOARD_WPA_SUPPLICANT_DRIVER=WEXT

BOARD_USES_MMX := true
BOARD_USES_SSE := true
BOARD_USES_SSE2 := true
BOARD_USES_SSE3 := true
BOARD_USES_MENLOW := true
BOARD_USES_LIBERTAS := true
BOARD_DISABLE_PM := true
BUILD_WITH_MPLAYER := true
