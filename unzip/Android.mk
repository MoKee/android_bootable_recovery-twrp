#
# Copyright (C) 2015 The Mokee Open Source Project
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
ifneq ($(wildcard external/unzip/Android.mk),)

LOCAL_PATH := external/unzip

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	match.c \
	inflate.c \
	crc32.c \
	ttyio.c \
	extract.c \
	globals.c \
	unreduce.c \
	envargs.c \
	ubz2err.c \
	unzip.c \
	unshrink.c \
	fileio.c \
	explode.c \
	zipinfo.c \
	crypt.c \
	list.c \
	process.c \
	unix/unix.c

LOCAL_CFLAGS := -DACORN_FTYPE_NFS -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT \
	-DUNICODE_SUPPORT -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD \
	-DDATE_FORMAT=DF_YMD -DUSE_BZIP2 -DIZ_HAVE_UXUIDGID -DNOMEMCPY \
	-DNO_WORKING_ISPRINT -DNO_LANGINFO_H -Wno-format-security

LOCAL_C_INCLUDES := \
	external/bzip2/include

LOCAL_STATIC_LIBRARIES := libbz
LOCAL_MODULE := unzip
LOCAL_MODULE := unzip_recovery
LOCAL_MODULE_STEM := unzip
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
endif 

