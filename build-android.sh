#!/bin/bash

#
# Copies the source files to the android destination
#

cp CPConsoleApp.cabal platforms/android/
cp LICENSE platforms/android/
cp src/* platforms/android/src/

cd platforms/android
sed -i -e '31s/-optl-shared/-shared/g' CPConsoleApp.cabal
sed -i -e '35s/cc-options/--cc-options/g' CPConsoleApp.cabal
sed -i -e '36s/ld-options/--ld-options/g' CPConsoleApp.cabal
ant debug

sed -i -e '31s/\-shared/-optl-shared/g' CPConsoleApp.cabal
sed -i -e '35s/\--cc-options/cc-options/g' CPConsoleApp.cabal
sed -i -e '36s/\--ld-options/ld-options/g' CPConsoleApp.cabal
ant debug
