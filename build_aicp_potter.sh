#!/bin/bash

# ADD SOURCE
if [ "$add_source" = true ]; then
repo init -u https://github.com/AICP/platform_manifest.git -b q10.0
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

# MAKE BUILD
if [ "$make_build" = true ]; then
. build/envsetup.sh
lunch aicp_potter-userdebug
mka bacon -j$(nproc --all)
fi