#
# Copyright (C) 2017 TeamNexus
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)

LOCAL_SRC_FILES := \
	power.cpp

LOCAL_MODULE               := power.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS          := optional
LOCAL_CFLAGS               := -Wall -Werror -Wno-unused-parameter -DLOG_TAG=\"$(LOCAL_MODULE)\"
LOCAL_PROPRIETARY_MODULE   := true

ifneq (,$(wildcard lineage-sdk/))
  LOCAL_CFLAGS := -DPOWER_HAS_LINEAGE_HINTS
endif

LOCAL_SHARED_LIBRARIES := \
	libhardware \
	liblog \
	libcutils

include $(BUILD_SHARED_LIBRARY)
