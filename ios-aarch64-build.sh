#!/bin/bash
#
# This script build for aarch64 iOS and then copies the
# static library to XCode
ARCH_OS=aarch64-apple-darwin14
ARCH=aarch64
if [ "$IOS_SCRIPTS" = "" -o "$XCODE_PROJECT_BUILD_DIR" = "" ]; then
    echo "Either IOS_SCRIPTS or XCODE_PROJECT_BUILD_DIR is not set"
    exit 1
fi


#
# Configure the project for ios builds
# 
$ARCH_OS-cabal configure -fios $@ && \
    $ARCH_OS-cabal build exe:CPConsoleAppStaticLib
[ $? -eq 0 ] || exit 1

echo
echo Copying to CPConsoleApp to $XCODE_PROJECT_BUILD_DIR
echo
if [ ! -d "$XCODE_PROJECT_BUILD_DIR/lib/$ARCH" ]; then
    mkdir -p $XCODE_PROJECT_BUILD_DIR/lib/$ARCH
fi
cp dist/$ARCH/build/CPConsoleAppStaticLib/CPConsoleAppStaticLib.a \
   "$XCODE_PROJECT_BUILD_DIR/lib/$ARCH/libCPConsoleApp.a"
