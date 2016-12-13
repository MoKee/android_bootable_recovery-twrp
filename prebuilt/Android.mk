LOCAL_PATH := $(call my-dir)

RELINK := $(LOCAL_PATH)/relink.sh

#dummy file to trigger required modules
include $(CLEAR_VARS)

LOCAL_MODULE := teamwin
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin

# Manage list
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/dump_image
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/flash_image
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/erase_image
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/bu
ifneq ($(TW_USE_TOOLBOX), true)
	RELINK_SOURCE_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/busybox
	ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 24; echo $$?),0)
		RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/sh
	endif
else
	RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/sh
	RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcrypto.so
	ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 23; echo $$?),0)
	    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/toybox
	    ifneq ($(wildcard external/zip/Android.mk),)
                RELINK_SOURCE_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/zip
	    endif
	    ifneq ($(wildcard external/unzip/Android.mk),)
                RELINK_SOURCE_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/unzip
	    endif
	endif
endif
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/pigz
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/fsck.fat
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/fatlabel
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/mkfs.fat
RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/e2fsck
RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mke2fs
RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/tune2fs
RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/resize2fs
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/simg2img
ifneq ($(TARGET_ARCH), x86_64)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/linker
endif
ifeq ($(TARGET_ARCH), x86_64)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/linker64
endif
ifeq ($(TARGET_ARCH), arm64)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/linker64
endif
#RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/twrpmtp
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libc.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcutils.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcrecovery.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libusbhost.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libutils.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libdl.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2_com_err.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2_e2p.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2fs.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2_profile.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2_uuid.so
ifneq ($(wildcard external/e2fsprogs/lib/quota/Android.mk),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2_quota.so
endif
ifneq ($(wildcard external/e2fsprogs/lib/ext2fs/Android.mk),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2fs.so
endif
ifneq ($(wildcard external/e2fsprogs/lib/blkid/Android.mk),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext2_blkid.so
endif
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libpng.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/liblog.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libm.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libstdc++.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libz.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libminuitwrp.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libminadbd.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libminzip.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libmtdutils.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libtar.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libtwadbbu.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libutil-linux.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libblkid.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libmmcutils.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libbmlutils.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libflashutils.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libfusesideload.so
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libbootloader_message.so
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -lt 23; echo $$?),0)
    # These libraries are no longer present in M
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libstlport.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libgccdemangle.so
endif
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -gt 23; echo $$?),0)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcrypto.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libpackagelistparser.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/liblzma.so
endif
ifneq (,$(filter $(PLATFORM_SDK_VERSION), 21 22))
    # libraries from lollipop
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libbacktrace.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libunwind.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libunwind-ptrace.so
    # Dynamically loaded by lollipop libc and may prevent unmounting system if it is not present in sbin
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libnetd_client.so
else
    ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 23; echo $$?),0)
        # Android M libraries
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libbacktrace.so
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libunwind.so
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libbase.so
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libc++.so
        # Dynamically loaded by libc and may prevent unmounting system if it is not present in sbin
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libnetd_client.so
    else
        # Not available in lollipop
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcorkscrew.so
    endif
endif
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -lt 24; echo $$?),0)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libmincrypttwrp.so
endif
RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/toolbox
ifneq ($(TW_OEM_BUILD),true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrp
else
    TW_EXCLUDE_MTP := true
endif
ifneq ($(TW_EXCLUDE_MTP), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libtwrpmtp.so
endif
ifeq ($(TARGET_USERIMAGES_USE_EXT4), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext4_utils.so
endif
RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libaosprecovery.so
ifneq ($(TW_INCLUDE_JPEG),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libjpeg.so
endif
ifeq ($(TWHAVE_SELINUX), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libselinux.so
    ifneq ($(TARGET_USERIMAGES_USE_EXT4), true)
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libext4_utils.so
    endif
endif
ifeq ($(BUILD_ID), GINGERBREAD)
    TW_NO_EXFAT := true
endif
ifneq ($(TW_NO_EXFAT), true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/mkexfatfs
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/fsck.exfat
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libexfat_twrp.so
else
    TW_NO_EXFAT_FUSE := true
endif
ifneq ($(TW_NO_EXFAT_FUSE), true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/exfat-fuse
endif
ifeq ($(TW_INCLUDE_BLOBPACK), true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/blobpack
endif
ifeq ($(TW_INCLUDE_INJECTTWRP), true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/injecttwrp
endif
ifeq ($(TW_INCLUDE_DUMLOCK), true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/htcdumlock
endif
ifeq ($(TW_INCLUDE_CRYPTO), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcryptfslollipop.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcrypto.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libhardware.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libgpt_twrp.so
    ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
        RELINK_SOURCE_FILES += $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcryptfs_hw.so
    endif
endif
ifeq ($(TARGET_USERIMAGES_USE_EXT4), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/make_ext4fs
endif
ifneq ($(wildcard system/core/libsparse/Android.mk),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libsparse.so
endif
ifneq ($(TW_EXCLUDE_ENCRYPTED_BACKUPS), true)
    RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/openaes
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libopenaes.so
endif
ifeq ($(TARGET_USERIMAGES_USE_F2FS), true)
    ifeq ($(shell test $(CM_PLATFORM_SDK_VERSION) -ge 4; echo $$?),0)
        RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mkfs.f2fs
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libf2fs.so
    else ifeq ($(shell test $(MK_PLATFORM_SDK_VERSION) -ge 4; echo $$?),0)
        RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mkfs.f2fs
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libf2fs.so
    else ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 23; echo $$?),0)
        RELINK_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/mkfs.f2fs
    else ifneq (,$(filter $(PLATFORM_SDK_VERSION), 21 22))
        RELINK_SOURCE_FILES += $(TARGET_ROOT_OUT_SBIN)/mkfs.f2fs
    else
        RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mkfs.f2fs
    endif
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/fsck.f2fs
endif
ifneq ($(wildcard system/core/reboot/Android.mk),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/reboot
endif
ifneq ($(TW_DISABLE_TTF), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libft2.so
endif
ifneq ($(TW_RECOVERY_ADDITIONAL_RELINK_FILES),)
    RELINK_SOURCE_FILES += $(TW_RECOVERY_ADDITIONAL_RELINK_FILES)
endif
ifneq ($(wildcard external/pcre/Android.mk),)
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libpcre.so
endif
ifeq ($(TW_INCLUDE_NTFS_3G),true)
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -gt 22; echo $$?),0)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mount.ntfs
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/fsck.ntfs
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mkfs.ntfs
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libntfs-3g.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libfuse.so
else
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/ntfs-3g
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/ntfsfix
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/mkntfs
endif
endif
ifeq ($(BOARD_HAS_NO_REAL_SDCARD),)
    ifeq ($(shell test $(PLATFORM_SDK_VERSION) -gt 22; echo $$?),0)
        RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/sgdisk
    endif
endif
ifeq ($(TWRP_INCLUDE_LOGCAT), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logcat
    ifeq ($(TARGET_USES_LOGD), true)
        RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logd
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libnl.so
    endif
    ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 24; echo $$?),0)
        RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libpcrecpp.so
    endif
endif
TWRP_AUTOGEN := $(intermediates)/teamwin
GEN := $(intermediates)/teamwin
$(GEN): $(RELINK)
$(GEN): $(RELINK_SOURCE_FILES) $(call intermediates-dir-for,EXECUTABLES,init)/init
	$(RELINK) $(TARGET_RECOVERY_ROOT_OUT)/sbin $(RELINK_SOURCE_FILES)

LOCAL_GENERATED_SOURCES := $(GEN)
LOCAL_SRC_FILES := teamwin $(GEN)
include $(BUILD_PREBUILT)

#permissive.sh
include $(CLEAR_VARS)
LOCAL_MODULE := permissive.sh
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

#mke2fs.conf
include $(CLEAR_VARS)
LOCAL_MODULE := mke2fs.conf
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/etc
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

ifeq ($(BOARD_HAS_NO_REAL_SDCARD),)
	ifeq ($(shell test $(PLATFORM_SDK_VERSION) -lt 23; echo $$?),0)
	    #prebuilt, static sgdisk
	    include $(CLEAR_VARS)
	    LOCAL_MODULE := sgdisk_static
	    LOCAL_MODULE_STEM := sgdisk
	    LOCAL_MODULE_TAGS := eng
	    LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
	    LOCAL_SRC_FILES := $(LOCAL_MODULE)
	    include $(BUILD_PREBUILT)
	endif
	#parted
	#include $(CLEAR_VARS)
	#LOCAL_MODULE := parted
	#LOCAL_MODULE_TAGS := eng
	#LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	#LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
	#LOCAL_SRC_FILES := $(LOCAL_MODULE)
	#include $(BUILD_PREBUILT)
endif

# copy license file for OpenAES
ifneq ($(TW_EXCLUDE_ENCRYPTED_BACKUPS), true)
	include $(CLEAR_VARS)
	LOCAL_MODULE := openaes_license
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/license/openaes
	LOCAL_SRC_FILES := ../openaes/LICENSE
	include $(BUILD_PREBUILT)
endif

ifeq ($(TW_INCLUDE_DUMLOCK), true)
	#htcdumlock for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := htcdumlocksys
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#flash_image for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := flash_imagesys
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#dump_image for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := dump_imagesys
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#libbmlutils for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := libbmlutils.so
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#libflashutils for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := libflashutils.so
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#libmmcutils for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := libmmcutils.so
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#libmtdutils for /system for dumlock
	include $(CLEAR_VARS)
	LOCAL_MODULE := libmtdutils.so
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#HTCDumlock.apk
	include $(CLEAR_VARS)
	LOCAL_MODULE := HTCDumlock.apk
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)$(TWHTCD_PATH)
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)
endif

ifneq ($(TW_EXCLUDE_SUPERSU), true)
	ifeq ($(TARGET_ARCH), arm)
		#chattr.pie
		include $(CLEAR_VARS)
		LOCAL_MODULE := chattr.pie
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)

		#libsupol.so
		include $(CLEAR_VARS)
		LOCAL_MODULE := libsupol.so
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)

		#su binary
		include $(CLEAR_VARS)
		LOCAL_MODULE := suarm
		LOCAL_MODULE_STEM := su
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)

		#supolicy
		include $(CLEAR_VARS)
		LOCAL_MODULE := supolicy
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)
	endif
	ifeq ($(TARGET_ARCH), arm64)
		#libsupol.so
		include $(CLEAR_VARS)
		LOCAL_MODULE := libsupol.soarm64
		LOCAL_MODULE_STEM := libsupol.so
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)

		#su binary
		include $(CLEAR_VARS)
		LOCAL_MODULE := suarm64
		LOCAL_MODULE_STEM := su
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)

		#supolicy
		include $(CLEAR_VARS)
		LOCAL_MODULE := supolicyarm64
		LOCAL_MODULE_STEM := supolicy
		LOCAL_MODULE_TAGS := eng
		LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
		LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
		LOCAL_SRC_FILES := $(LOCAL_MODULE)
		include $(BUILD_PREBUILT)
	endif

	#install-recovery.sh
	include $(CLEAR_VARS)
	LOCAL_MODULE := install-recovery.sh
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#install-supersu.sh
	include $(CLEAR_VARS)
	LOCAL_MODULE := install-supersu.sh
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#99SuperSUDaemon
	include $(CLEAR_VARS)
	LOCAL_MODULE := 99SuperSUDaemon
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)

	#SuperSU special installer APK
	include $(CLEAR_VARS)
	LOCAL_MODULE := Superuser.apk
	LOCAL_MODULE_TAGS := eng
	LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
	LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/supersu
	LOCAL_SRC_FILES := $(LOCAL_MODULE)
	include $(BUILD_PREBUILT)
endif
