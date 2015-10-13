#!/bin/bash

# IOS CONFUGURATIE
if [[ $(uname ) == 'Darwin' ]]
   git submodules update
   (cd ghc-ios-scripts; ./installGHCiOS.sh)
fi
