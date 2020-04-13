#!/bin/bash

#CLEAN BUILD DIRECTORY
rm -rf ~/builds/aicp-15.0

#MAKING BUILD DIRECTORY
mkdir ~/builds/aicp-15.0
cd ~/builds/aicp-15.0/

#ADDING AICP SOURCE
repo init -u https://github.com/AICP/platform_manifest.git -b q10.0

#ADDING MOTO G5 PLUS (POTTER) DEVICE TREE, KERNEL, VENDOR AND OTHER SOURCE FOR BUILDING AICP-15.0
mkdir .repo/local_manifests
FILE=".repo/local_manifests/roomservice.xml"
/bin/cat <<EOM >$FILE
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/motorola/potter" name="abhijit1998/aicp_device_potter" remote="github" revision="q10.0" />
  <project path="vendor/motorola/potter" name="ArrowOS-Devices/android_vendor_motorola_potter" remote="github" revision="arrow-10.0" />
  <project path="kernel/motorola/potter" name="ArrowOS-Devices/android_kernel_motorola_potter" remote="github" revision="arrow-10.0" />
  <project path="packages/resources/MotoActions" name="ArrowOS-Devices/packages_resources_MotoActions" remote="github" revision="arrow-10.0" />
  <project path="system/qcom" name="LineageOS/android_system_qcom" remote="github" revision="lineage-17.0" />
</manifest>
EOM

#REPO SYNC / DOWNLOAD SOURCE FILES
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags