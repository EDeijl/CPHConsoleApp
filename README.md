# CPHConsoleApp
Cross Platform Haskell console application that outputs Hello World on iOS and Android.

## prerequisites
- a machine with OS X installed.
- Xcode
- Docker
- GHC and Cabal
- The android platform tools for easy installation of the `.apk` file

## installation
First make sure that __jobs: $ncpus__ is disabled in `~/.cabal/config` (you can comment it out like `--jobs: $ncpus`)

    $ git clone --recursive https://github.com/EDeijl/CPCHonsoleApp.git
    $ cd CPHConsoleApp
    $ ./setup.sh # will install ghc-ios dependencies and set up the docker machine for Android builds

## usage
### iOS 
Run `./ios-full-build.sh`
This will build the project and generate the necessary `.a` and `.h` files in the XCode project directory (found in `platforms/ios`.
Open the XCode project and check if there is a lib directory in your project with a `HaskellActivity_stub.h` and a `CPConsoleAppStaticLib.a` file in it. (It is fine if it also exists in the root of the project).

If the library and header files aren't there, click file -> Add files to project, select the `lib` folder and make sure the check next to Add to targets is enabled (if you don't see Add to target, click options on the bottom of the file chooser).

In the `HaskelliOS.xcconfig` (Also in the XCode project folder) check that the `HEADER_SEARCH_PATHS` variable is set to the `include` folder of your GHC installation, otherwise Xcode is not able to compile the project.

If everything went correctly, you can now run the application on a device, and in the terminal output it will say "Hello World!"

### Android
For the Android build we make use of a Docker image that has all the dependencies for this project installed.
The `setup.sh` script that you executed on installation built the docker image, and all we have to do is connect to a container and build the apk.

    erik@localhost:../CPHConsoleApp $ docker run -it android_build_env /bin/bash
    androidbuilder@c2f82ac851a1:~/build $ cd CPConsoleApp
    androidbuilder@c2f82ac851a1:~/build $ ./build-android.sh

These commands will connect to the docker container with a bash shell, `cp` into the project directory and build the android .apk

In another terminal shell on your own machine run `docker ps` it will return something like this:

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    58d6fbb02800        android_build_env   "/bin/bash"         4 seconds ago       Up 4 seconds                            jovial_archimedes

Now we know the name of the container and can copy the .apk file to our local machine.

    docker cp jovial_archimedes:/home/androidbuilder/build/CPConsoleApp/platforms/android/bin/HaskellActivity-debug.apk .

Now that we have the `.apk` on our local machine, we can install it on a device with `adb install -r HaskellActivity-debug.apk`.


## Made possible by
- CJ van den Berg with his work on [ghc-android](https://github.com/neurocyte/ghc-android), [android-haskell-activity](https://github.com/neurocyte/android-haskell-activity) and [foreign-jni](https://github.com/neurocyte/foreign-jni).
- Sean Seefried for his work on the [docker image for android builds](https://github.com/sseefried/docker-build-ghc-android) and the iOS build scripts in the [Epidemic](https://github.com/sseefried/open-epidemic-game) game.
