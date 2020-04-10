#!/bin/bash

#CLEANING BUILD DIRECTORY
rm -rf ~/builds/havoc-10.0

#MAKING BUILD DIRECTORY
mkdir ~/builds/havoc-10.0
cd ~/builds/havoc-10.0/

#ADDING HAVOC SOURCE
repo init -u https://github.com/Havoc-OS/android_manifest.git -b ten

#ADDING MOTO G5 PLUS (POTTER) DEVICE TREE, KERNEL, VENDOR AND OTHER SOURCE FOR BUILDING HAVOC
mkdir .repo/local_manifests
FILE=".repo/local_manifests/roomservice.xml"
/bin/cat <<EOM >$FILE
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/motorola/potter" name="abhijit1998/device_motorola_potter" remote="github" revision="havoc-10.0" />
  <project path="vendor/motorola" name="PixelExperience-Devices/vendor_motorola" remote="github" revision="ten" />
  <project path="kernel/motorola/potter" name="GZR-Kernels/Optimus_Drunk_Potter" remote="github" revision="10.0" />
  <project path="packages/resources/MotoActions" name="ArrowOS-Devices/packages_resources_MotoActions" remote="github" revision="arrow-10.0" />
  <project path="system/qcom" name="LineageOS/android_system_qcom" remote="github" revision="lineage-17.0" />
</manifest>
EOM

#REPO SYNC / DOWNLOAD SOURCE FILES
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

#USE CCACHE (OPTIONAL)
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)

#BUILD ROM FOR MOTO G5 PLUS (POTTER)
. build/envsetup.sh
lunch havoc_potter-userdebug
mka bacon -j$(nproc --all)