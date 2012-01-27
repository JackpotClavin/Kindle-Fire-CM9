#
# Copyright (C) 2011 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true
#TARGET_PROVIDES_INIT_RC := true
#BIONIC_ICS := true
#SURFACEFLINGER_FORCE_SCREEN_RELEASE := true
#DSURFACEFLINGER_FORCE_SCREEN_RELEASE := true
BOARD_HAVE_FAKE_GPS := true
#BOARD_CUSTOM_USB_CONTROLLER := ../../device/amazon/otter/UsbController.cpp

# inherit from the proprietary version
-include vendor/amazon/otter/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
NEEDS_ARM_ERRATA_754319_754320 := true
TARGET_GLOBAL_CFLAGS += -DNEEDS_ARM_ERRATA_754319_754320
#BOARD_NEEDS_CUTILS_LOG := true

#Jon's shit
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE \
			-DMISSING_GRALLOC_BUFFERS
MISSING_EGL_EXTERNAL_IMAGE := true
MISSING_GRALLOC_BUFFERS := true
DMISSING_EGL_EXTERNAL_IMAGE := true
DMISSING_GRALLOC_BUFFERS := true
TARGET_NO_BOOTLOADER := true
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/amazon/otter/releasetools/otter_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/amazon/otter/releasetools/otter_ota_from_target_files


BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
#BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=463M@0x80000000 init=/init vram=5M omapfb.vram=0:5M
BOARD_KERNEL_CMDLINE := console=ttyO2,115200n8 mem=463M@0x80000000 init=/init vram=32M omapfb.vram=0:16M
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := otter
TARGET_BOARD_INFO_FILE := device/amazon/otter/board-info.txt
BOARD_EGL_CFG := device/amazon/otter/misc/egl.cfg
#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
#DSCORPION_NEON_OPTIMIZATION := true
#DEBUG_BIONIC_LIBC := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/platform/mmci-omap-hs.1/by-name/media
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/platform/mmci-omap-hs.1/by-name/media

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
#USE_OPENGL_RENDERER := true

#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_otter

# device-specific extensions to the updater binary
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_otter

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1192230912
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_PROVIDES_INIT_RC := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Do da wifi
USES_TI_WL1283 := true
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
#BOARD_HOSTAPD_DRIVER        := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
HOSTAPD_VERSION             := VER_0_6_X
BOARD_WLAN_DEVICE           := wl1283
BOARD_SOFTAP_DEVICE         := wl1283
#BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_PATH     := "/system/etc/wifi/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/firmware.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/softap/firmware_ap.bin"
#BOARD_WEXT_NO_COMBO_SCAN := true
#ifdef
#    CFLAGS += -DWEXT_NO_COMBO_SCAN	
#endif

BOARD_USES_GENERIC_AUDIO := false

#Do da audio
#BOARD_USES_TI_OMAP_MODEM_AUDIO := true
#BOARD_USES_ALSA_AUDIO := true
#BUILD_WITH_ALSA_UTILS := true
#BOARD_USES_ALSA_AUDIO := true
#BUILD_WITH_ALSA_UTILS := true
#HAVE_2_3_DSP := 1

BOARD_USES_AUDIO_LEGACY := true
ifdef BOARD_USES_AUDIO_LEGACY
    COMMON_GLOBAL_CFLAGS += -DBOARD_USES_AUDIO_LEGACY
endif
#BOARD_USE_KINETO_COMPATIBILITY := true
#LOCAL_CFLAGS += -DUSE_KINETO_COMPATIBILITY
#DUSE_KINETO_COMPATIBILITY := true

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT
endif
endif

#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
#BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_HAS_LARGE_FILESYSTEM := true

#TARGET_PROVIDES_LIBAUDIO := true

BOARD_HAVE_BLUETOOTH := true
TARGET_RELEASETOOLS_EXTENSIONS := device/amazon/otter/releasetools/
BOARD_LIB_DUMPSTATE := libdumpstate.otter
BOARD_USES_SECURE_SERVICES := true

COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE \
			-DMISSING_GRALLOC_BUFFERS \
			-DMISSING_EGL_PIXEL_FORMAT_YV12

DMISSING_EGL_EXTERNAL_IMAGE := true
DMISSING_EGL_PIXEL_FORMAT_YV12 := true
DMISSING_GRALLOC_BUFFERS := true
##DBOARD_GL_OES_EGL_IMG_EXTERNAL_HACK := true

MISSING_EGL_EXTERNAL_IMAGE := true
MISSING_EGL_PIXEL_FORMAT_YV12 := true
MISSING_GRALLOC_BUFFERS := true
##BOARD_GL_OES_EGL_IMG_EXTERNAL_HACK := true
BOARD_USE_LEGACY_TOUCHSCREEN := true
