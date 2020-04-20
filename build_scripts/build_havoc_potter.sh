#!/bin/bash

# ADD SOURCE
if [ "$add_source" = true ]; then
repo init -u https://github.com/Havoc-OS/android_manifest.git -b ten
mkdir .repo/local_manifests
FILE=".repo/local_manifests/roomservice.xml"
/bin/cat <<EOM >$FILE
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/motorola/potter" name="abhijit1998/device_motorola_potter" remote="github" revision="havoc-10.0" />
  <project path="vendor/motorola/potter" name="ArrowOS-Devices/android_vendor_motorola_potter" remote="github" revision="arrow-10.0" />
  <project path="kernel/motorola/potter" name="GZR-Kernels/Optimus_Drunk_Potter" remote="github" revision="10.0" />
  <project path="packages/resources/MotoActions" name="ArrowOS-Devices/packages_resources_MotoActions" remote="github" revision="arrow-10.0" />
  <project path="system/qcom" name="LineageOS/android_system_qcom" remote="github" revision="lineage-17.0" />
</manifest>
EOM
fi

# REPO SYNC / DOWNLOAD SOURCE FILES
if [ "$repo_sync" = true ]; then
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

# CLEAN OUT DIRECTORY
if [ "$clean_out" = true ]; then
rm -rf out
fi

# USING CCACHE
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)

# GAPPS BUILD
if [ "$make_gapps" = true ]; then
export WITH_GAPPS=true && export TARGET_GAPPS_ARCH=arm64
fi

# MAKE BUILD
if [ "$make_build" = true ]; then
. build/envsetup.sh
lunch havoc_potter-userdebug
mka bacon -j$(nproc --all)
fi