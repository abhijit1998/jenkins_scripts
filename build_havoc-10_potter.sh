#!/bin/bash
cd ~/builds/havoc-10.0/
. build/envsetup.sh
lunch havoc_potter-userdebug
mka bacon -j$(nproc --all)