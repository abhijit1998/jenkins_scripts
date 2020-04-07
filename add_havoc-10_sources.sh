#!/bin/bash
#ADDING SOURCE
rm -rf ~/builds/havoc-10.0
mkdir ~/builds/havoc-10.0
cd ~/builds/havoc-10.0/
repo init -u https://github.com/Havoc-OS/android_manifest.git -b ten
mkdir .repo/local_manifests
FILE=".repo/local_manifests/roomservice.xml"
/bin/cat <<EOM >$FILE
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/motorola/potter" name="abhijit1998/device_motorola_potter" remote="github" revision="havoc-10.0" />
  <project path="vendor/motorola/potter" name="ArrowOS-Devices/android_vendor_motorola_potter" remote="github" revision="arrow-10.0" />
  <project path="kernel/motorola/potter" name="ArrowOS-Devices/android_kernel_motorola_potter" remote="github" revision="arrow-10.0" />
  <project path="packages/resources/MotoActions" name="PixelExperience/packages_resources_MotoActions" remote="github" revision="pie" />
  <project path="system/qcom" name="LineageOS/android_system_qcom" remote="github" revision="lineage-17.0" />
</manifest>
EOM