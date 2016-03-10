#
# Copyright (C) 2014 The Android Open Source Project
# Copyright (C) 2016 Mokee Open Source Project
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

ifneq ($(wildcard external/toybox/Android.mk),)

ifeq ($(TW_USE_TOOLBOX), true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := toybox.c

LOCAL_MODULE := toybox_recovery
LOCAL_MODULE_STEM := toybox
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES := libtoybox_driver
LOCAL_SHARED_LIBRARIES := libcutils libselinux
LOCAL_ADDITIONAL_DEPENDENCIES := toybox_symlinks

include $(BUILD_EXECUTABLE)

# for dumping the list of toys
TOYBOX_INSTLIST := $(HOST_OUT_EXECUTABLES)/toybox-instlist

# we still want a link for ls/ps/getprop/setprop, but the toolbox version needs to
# stick around for compatibility reasons, for now.
TOYS_WITHOUT_LINKS := ls ps getprop setprop

# Run toybox-instlist and generate the rest of the symlinks
toybox_symlinks: $(TOYBOX_INSTLIST)
toybox_symlinks: TOY_LIST=$(shell $(TOYBOX_INSTLIST))
toybox_symlinks: TOYBOX_BINARY := $(TARGET_RECOVERY_ROOT_OUT)/sbin/toybox
toybox_symlinks:
	@echo -e ${CL_CYN}"Generate Toybox links:"${CL_RST} $(TOY_LIST)
	@mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/sbin
	$(hide) $(foreach t,$(filter-out $(TOYS_WITHOUT_LINKS),$(TOY_LIST)),ln -sf toybox $(TARGET_RECOVERY_ROOT_OUT)/sbin/$(t);)

endif

endif
