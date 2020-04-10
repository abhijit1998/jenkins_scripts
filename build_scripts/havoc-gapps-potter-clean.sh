#!/bin/bash

cd ~/builds/havoc-10.0/

#DELETE OUT DIRECTORY
rm -rf out

#USE CCACHE (OPTIONAL)
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)

#BUILD ROM FOR MOTO G5 PLUS (POTTER)
export WITH_GAPPS=true && export TARGET_GAPPS_ARCH=arm64
. build/envsetup.sh
lunch havoc_potter-userdebug
mka bacon -j$(nproc --all)