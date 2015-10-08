#!/bin/bash

#
# Copies the source files to the android destination
#

cp CPConsoleApp.cabal platforms/android/
cp src/* platforms/android/src/

cd platforms/android
cabal build exe:libCPConsoleApp.so -fandroid
