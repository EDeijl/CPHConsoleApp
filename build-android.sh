#!/bin/bash

#
# Copies the source files to the android project destination
#

cp CPConsoleApp.cabal platforms/android/
cp LICENSE platforms/android/
cp src/* platforms/android/src/

cd platforms/android

#
# Do a search and replace in the cabal file to acommodate for a weird bug that can be fixed
# by building the project twice with different cabal configurations.
#
sed -i -e '37s/-optl-shared/-shared/g' CPConsoleApp.cabal
sed -i -e '41s/cc-options/--cc-options/g' CPConsoleApp.cabal
sed -i -e '42s/ld-options/--ld-options/g' CPConsoleApp.cabal
ant debug

sed -i -e '37s/\-shared/-optl-shared/g' CPConsoleApp.cabal
sed -i -e '41s/\--cc-options/cc-options/g' CPConsoleApp.cabal
sed -i -e '42s/\--ld-options/ld-options/g' CPConsoleApp.cabal
ant debug
