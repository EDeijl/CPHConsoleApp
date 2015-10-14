# CPHConsoleApp

Cross Platform Haskell Console Application that outputs `Hello World` on iOS, Android and Desktop. This is merely a proof-of-concept, showing how to target several platforms from a single Haskell codebase.


## Prerequisites

For all platforms:
- GHC (tested with 7.10.2)
- Cabal (tested with 1.22.6)

For iOS:
- Machine with OSX installed (tested on El Capitan)
- Xcode (tested with 7.0.1)

For Android:
- Docker (1.6 or greater is required)
- The android platform tools for easy installation of the `.apk` file


## Installation

First make sure to have `jobs: $ncpus` commented out in `~/.cabal/config`.

Then run the following commands:

    git clone --recursive https://github.com/EDeijl/CPCHonsoleApp.git
    cd CPHConsoleApp
    ./setup.sh

The `setup.sh` script installs ghc-ios dependencies (when on OSX) and creates a docker container for Android builds.


## Building

#### iOS

Run `./prepare-ios-all.sh` to build the Haskell code of the project. This will put several library (`.a`) and header (`.h`) files in the Xcode project directory (`./platforms/ios/`).

Use Xcode to open the project and check if the `lib` directory in your project contains `HaskellActivity_stub.h` and `CPConsoleAppStaticLib.a`. It is no problem these files also exist in the root of the project.
If the library and header files cannot be found in your project, then click `File -> Add files to project`, select the `lib` folder and make sure that `Add to targets` is enabled. In case you do not see `Add to target`, click options at the bottom of the file open dialog.

In the `HaskelliOS.xcconfig` (which can be found in the Xcode project folder), the `HEADER_SEARCH_PATHS` variable should point to the `include` folder of your GHC installation, otherwise Xcode is not able to compile the project. The `include` folder is found in the location where your GHC is installed. It's path usually end with something like `lib/ghc-7.10.2/include/` and contains several header files (we include `HsFFI.h`).

Xcode should now be able to build and run the project. If all went well, the application is automatically run. In the terminal output it will read "Hello World!".


#### Android

For the Android build we make use of a Docker image that has all the dependencies for this project installed.
The `setup.sh` script has already prepared this docker image for us. 

With the following commands we start a container, build the `.apk` file, copy it to our host machine and remove the container so it will not conflict with the next build.

    docker run --name apkbuilder -a stdout -a stdin android_build_env \
        /bin/bash -cl "cd CPConsoleApp; ./build-android.sh"
    docker cp \
        apkbuilder:/home/androidbuilder/build/CPConsoleApp/platforms/android/bin/HaskellActivity-debug.apk .
    docker rm apkbuilder
    
Now that we have the `.apk` on our local machine, we can install it on a device with `adb install -r HaskellActivity-debug.apk`. If a device is attached it will install the package there, otherwise it will try to run an emulator.


## Credits

This is mainly a merger to two existing examples of compiling Haskell to mobile devices:

CJ van den Berg's [ghc-android](https://github.com/neurocyte/ghc-android), [android-haskell-activity](https://github.com/neurocyte/android-haskell-activity) and [foreign-jni](https://github.com/neurocyte/foreign-jni).

Sean Seefried's [docker image for android builds](https://github.com/sseefried/docker-build-ghc-android) and iOS build scripts in [his Epidemic game](https://github.com/sseefried/open-epidemic-game).

Without their prior work this would have not been possible.


## TODO

* Extend this example with SDL and networking

