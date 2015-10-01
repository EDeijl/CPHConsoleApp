#!/bin/bash
#
# This script build for iOS on all 3 architectures and then copies each version of the
# static library to XCode
ARCH_OS=arm-apple-darwin10
ARCH=arm
if [ "$IOS_SCRIPTS" = "" -o "$XCODE_PROJECT_BUILD_DIR" = "" ]; then
    echo "Either IOS_SCRIPTS or XCODE_PROJECT_BUILD_DIR is not set"
    exit 1
fi


$ARCH_OS-cabal configure -fios $@ && \
    $ARCH_OS-cabal build exe:CPConsoleAppStaticLib
[ $? -Eq 0 ] || exit 1

echo
echo Copying to CPConsoleApp to $XCODE_PROJECT_BUILD_DIR
echo
if [ ! -d "$XCODE_PROJECT_BUILD_DIR/lib/$ARCH" ]; then
    mkdir -p $XCODE_PROJECT_BUILD_DIR/lib/$ARCH
fi
cp dist/$ARCH/build/CPConsoleAppStaticLib/CPConsoleAppStaticLib.a \
   "$XCODE_PROJECT_BUILD_DIR/lib/$ARCH/libCPConsoleApp.a"
