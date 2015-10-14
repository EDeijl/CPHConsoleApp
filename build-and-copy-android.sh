#!/bin/bash

# run a docker container and the build scripts
docker run --name android -a stdout -a stdin  android_build_env /bin/bash -cl "cd CPConsoleApp; ./build-android.sh"
# copy the resulting .apk from the container to the host machine
docker cp android:/home/androidbuilder/build/CPConsoleApp/platforms/android/bin/HaskellActivity-debug.apk .
# remove the container so we have a clean build next time
docker rm android
