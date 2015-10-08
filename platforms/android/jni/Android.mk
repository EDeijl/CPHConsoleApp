LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := hw-prebuilt

LOCAL_STATIC_LIBRARIES := ../obj/local/$(TARGET_ARCH_ABI)/build/libHSCPConsoleApp-0.1.0.0.a
include $(PREBUILT_SHARED_LIBRARY)
include $(BUILD_SHARED_LIBRARY)
