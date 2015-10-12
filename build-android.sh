#!/bin/bash

#
# Copies the source files to the android destination
#

cp CPConsoleApp.cabal platforms/android/
cp src/* platforms/android/src/

cd platforms/android
sed -i -e 's/-optl-shared/-shared/g' CPConsoleApp.cabal
sed -i -e 's/cc-options/--cc-options/g' CPConsoleApp.cabal
sed -i -e 's/ld-options/--ld-options/g' CPConsoleApp.cabal
ant debug
git reset --hard CPConsoleApp.cabal
ant debug
