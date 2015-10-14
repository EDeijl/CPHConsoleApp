#!/bin/bash
#
# This script build for i386 iOS and then copies the
# static library to XCode

ARCH_OS=i386-apple-darwin11
ARCH=i386
if [ "$IOS_SCRIPTS" = "" -o "$XCODE_PROJECT_BUILD_DIR" = "" ]; then
    echo "Either IOS_SCRIPTS or XCODE_PROJECT_BUILD_DIR is not set"
    exit 1
fi

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
