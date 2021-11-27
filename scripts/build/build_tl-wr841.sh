#!/bin/bash
./scripts/feeds update -a
./scripts/feeds install -a
echo "# Setting config..."
echo "# Set target
CONFIG_TARGET_ath79=y
CONFIG_TARGET_ath79_generic=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_ath79_generic_DEVICE_tplink_tl-wr841-v11-16m=y
CONFIG_TARGET_DEVICE_ath79_generic_DEVICE_tplink_tl-wr841-v9-16m=y
# Add packages
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_relayd=y
CONFIG_PACKAGE_luci-proto-relay=y
CONFIG_PACKAGE_wpad=y
# Remove packages:
CONFIG_PACKAGE_wpad-mini=n
# Enable menus
CONFIG_DEVEL=y
CONFIG_IMAGEOPT=y
CONFIG_VERSIONOPT=y
# Build options
CONFIG_STRIP_KERNEL_EXPORTS=y
CONFIG_USE_MKLIBS=y
CONFIG_CCACHE=y
CONFIG_VERSION_FILENAMES=y" > .config
make defconfig && ./scripts/diffconfig.sh > .config.diff
echo "# Compiling..."
time make -j32
echo "# Done."
