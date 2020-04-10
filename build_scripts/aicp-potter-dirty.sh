#!/bin/bash

cd ~/builds/aicp-15.0/

#USE CCACHE (OPTIONAL)
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)

#BUILD ROM FOR MOTO G5 PLUS (POTTER)
. build/envsetup.sh
lunch aicp_potter-userdebug
mka bacon -j$(nproc --all)