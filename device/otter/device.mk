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

# This file includes all definitions that apply to ALL otter devices, and
# are also specific to otter devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/amazon/otter/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/amazon/otter/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_PACKAGES := \
	lights.otter \
	charger \
	charger_res_images

PRODUCT_PACKAGES += \
	libinvensense_mpl

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/amazon/otter/root/default.prop:root/default.prop \
	device/amazon/otter/root/init.omap4430.rc:root/init.omap4430.rc \
	device/amazon/otter/root/init.rc:root/init.rc \
	device/amazon/otter/root/init.omap4430.usb.rc:root/init.omap4430.usb.rc \
	device/amazon/otter/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
	device/amazon/otter/misc/media_profiles.xml:system/etc/media_profiles.xml \
	device/amazon/otter/twl4030_pwrbutton.kl:system/usr/keylayout/twl4030_pwrbutton.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/misc/vold.conf:system/etc/vold.conf

#Los EGL blobs
PRODUCT_COPY_FILES += \
        device/amazon/otter/prebuilt/vendor/lib/hw/gralloc.omap4.so:system/vendor/lib/hw/gralloc.omap4.so \
        device/amazon/otter/prebuilt/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
        device/amazon/otter/prebuilt/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
        device/amazon/otter/prebuilt/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
        device/amazon/otter/prebuilt/vendor/lib/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \
        device/amazon/otter/prebuilt/vendor/lib/libIMGegl.so:system/vendor/lib/libIMGegl.so \
        device/amazon/otter/prebuilt/vendor/lib/libpvr2d.so:system/vendor/lib/libpvr2d.so \
        device/amazon/otter/prebuilt/vendor/lib/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \
        device/amazon/otter/prebuilt/vendor/lib/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \
        device/amazon/otter/prebuilt/vendor/lib/libsrv_init.so:system/vendor/lib/libsrv_init.so \
        device/amazon/otter/prebuilt/vendor/lib/libsrv_um.so:system/vendor/lib/libsrv_um.so \
        device/amazon/otter/prebuilt/vendor/lib/libusc.so:system/vendor/lib/libusc.so \
        device/amazon/otter/prebuilt/vendor/bin/320x240.nv12:system/vendor/bin/320x240.nv12 \
        device/amazon/otter/prebuilt/vendor/bin/framebuffer_test:system/vendor/bin/framebuffer_test \
        device/amazon/otter/prebuilt/vendor/bin/hal_client_test:system/vendor/bin/hal_client_test \
        device/amazon/otter/prebuilt/vendor/bin/hal_server_test:system/vendor/bin/hal_server_test \
        device/amazon/otter/prebuilt/vendor/bin/pvr2d_test:system/vendor/bin/pvr2d_test \
        device/amazon/otter/prebuilt/vendor/bin/pvrsrvinit:system/vendor/bin/pvrsrvinit \
        device/amazon/otter/prebuilt/vendor/bin/services_test:system/vendor/bin/services_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_blit_test:system/vendor/bin/sgx_blit_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_clipblit_test:system/vendor/bin/sgx_clipblit_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_flip_test:system/vendor/bin/sgx_flip_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_init_test:system/vendor/bin/sgx_init_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_render_flip_test:system/vendor/bin/sgx_render_flip_test \
        device/amazon/otter/prebuilt/vendor/bin/testwrap:system/vendor/bin/testwrap \
        device/amazon/otter/prebuilt/vendor/bin/320x240.nv12:system/bin/320x240.nv12 \
        device/amazon/otter/prebuilt/vendor/bin/framebuffer_test:system/bin/framebuffer_test \
        device/amazon/otter/prebuilt/vendor/bin/hal_client_test:system/bin/hal_client_test \
        device/amazon/otter/prebuilt/vendor/bin/hal_server_test:system/bin/hal_server_test \
        device/amazon/otter/prebuilt/vendor/bin/pvr2d_test:system/bin/pvr2d_test \
        device/amazon/otter/prebuilt/vendor/bin/pvrsrvinit:system/bin/pvrsrvinit \
        device/amazon/otter/prebuilt/vendor/bin/services_test:system/bin/services_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_blit_test:system/bin/sgx_blit_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_clipblit_test:system/bin/sgx_clipblit_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_flip_test:system/bin/sgx_flip_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_init_test:system/bin/sgx_init_test \
        device/amazon/otter/prebuilt/vendor/bin/sgx_render_flip_test:system/bin/sgx_render_flip_test \
        device/amazon/otter/prebuilt/vendor/bin/testwrap:system/bin/testwrap

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

PRODUCT_COPY_FILES += \
    device/amazon/otter/audio/libaudio.so:/system/lib/libaudio.so \
    device/amazon/otter/audio/alsa.omap4.so:/system/lib/hw/alsa.omap4.so \
    device/amazon/otter/audio/libaudiomodemgeneric.so:/system/lib/libaudiomodemgeneric.so \
    device/amazon/otter/audio/libasound.so:/system/lib/libasound.so

# Wifi
#ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
#PRODUCT_COPY_FILES += \
#	$(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcmdhd.ko
#endif

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=tiwlan0 \
	wifi.supplicant_scan_interval=60

PRODUCT_COPY_FILES += \
	device/amazon/otter/misc/ilitek_i2c.idc:system/usr/idc/ilitek_i2c.idc

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

PRODUCT_PACKAGES += \
	libaudioutils \
	audio.a2dp.default \
	hwprops \
	CMStats \
	libaudiohw_legacy \
	audio.primary.omap4430

# These are the hardware-specific features
# fake some permissions in tablet_core_hardware.xml for testing purpose (market fix)
PRODUCT_COPY_FILES += \
	device/amazon/otter/overlay/frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml 

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version = 131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density = 160

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=1

PRODUCT_CHARACTERISTICS := nosdcard tablet

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	Trebuchet \
	Launcher2 \
	Superuser \
	librs_jni \
	com.android.future.usb.accessory \
	tiwlan.ini \
	wlan_cu \
	wlan_loader \
	libCustomWifi \
	wpa_supplicant.conf \
	dhcpcd.conf

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

PRODUCT_PACKAGES += \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
	PRODUCT_PACKAGES += send_bug
	PRODUCT_COPY_FILES += \
		system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
		system/extras/bugmailer/send_bug:system/bin/send_bug
endif

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
