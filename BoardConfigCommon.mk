# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version
# needed for BP-flashing updater extensions

# Default value, if not overridden else where.
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/asus/grouper/bluetooth

TARGET_BOARD_PLATFORM := tegra3
TARGET_TEGRA_VERSION := t30

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912 # 12M

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

TARGET_BOOTLOADER_BOARD_NAME := grouper

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false

BOARD_USES_GENERIC_INVENSENSE := false

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/asus/grouper/egl.cfg

ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_USES_GROUPER_MODULES := true

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_grouper
MALLOC_IMPL := dlmalloc

BOARD_SEPOLICY_DIRS += \
        device/asus/grouper/sepolicy

BOARD_SEPOLICY_UNION += \
        file_contexts \
        genfs_contexts \
        bluetooth.te \
        device.te \
        domain.te \
        drmserver.te \
        init_shell.te \
        file.te \
        gpsd.te \
        keystore.te \
        lmkd.te \
        mediaserver.te \
        recovery.te \
        rild.te \
        sensors_config.te \
        surfaceflinger.te \
        system_app.te \
        system_server.te \
        ueventd.te \
        vold.te

#TWRP config:
DEVICE_RESOLUTION := 800x1280
LANDSCAPE_RESOLUTION := 1280x800
TW_DEFAULT_ROTATION := 0
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_BRIGHTNESS_PATH := /sys/devices/platform/pwm-backlight/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
HAVE_SELINUX := true
BOARD_CUSTOM_BOOTIMG_MK := device/asus/grouper/custombootimg.mk

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/asus/grouper/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_FONT := 216
MR_FSTAB := device/asus/grouper/twrp.fstab
MR_KEXEC_MEM_MIN := 0x85000000
MR_INFOS := device/asus/grouper/mrom_infos
MR_ENCRYPTION := true
MR_DEVICE_VARIANTS := tilapia
MR_DEVICE_HOOKS := device/asus/grouper/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3
TARGET_RECOVERY_IS_MULTIROM := true
