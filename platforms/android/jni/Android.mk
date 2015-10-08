LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := hw-prebuilt

LOCAL_SRC_FILES := ../obj/local/$(TARGET_ARCH_ABI)/build/libHSCPConsoleApp-0.1.0.0.a
include $(PREBUILD_STATIC_LIBRARY)
