#!/bin/bash

#
# Copies the source files to the android destination
#

cp CPConsoleApp.cabal platforms/android/
cp LICENSE platforms/android/
cp src/* platforms/android/src/

Cd platforms/android
sed -i -e '48s/-optl-shared/-shared/g' CPConsoleApp.cabal
sed -i -e '52s/cc-options/--cc-options/g' CPConsoleApp.cabal
sed -i -e '53s/ld-options/--ld-options/g' CPConsoleApp.cabal
Ant debug

sed -i -e '47s/\-shared/-optl-shared/g' CPConsoleApp.cabal
sed -i -e '51s/\--cc-options/cc-options/g' CPConsoleApp.cabal
sed -i -e '52s/\--ld-options/ld-options/g' CPConsoleApp.cabal
Ant debug
