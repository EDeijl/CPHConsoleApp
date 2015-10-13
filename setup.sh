#!/bin/bash

# iOS Configuration
if [[ $(uname ) == 'Darwin' ]] ; then
   (cd ghc-ios-scripts; ./installGHCiOS.sh)
fi

# Android Configuration
(cd basic-hs-android-docker; docker build -t android_build_env .)

