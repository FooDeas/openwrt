#!/bin/bash
./scripts/feeds update -a
./scripts/feeds install -a
echo "# Setting config..."
echo "# Set target
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
CONFIG_GRUB_EFI_IMAGES=n
CONFIG_TARGET_ROOTFS_EXT4FS=n
CONFIG_TARGET_ROOTFS_TARGZ=n
CONFIG_TARGET_ROOTFS_PARTSIZE=1000
# Add packages
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-theme-material=y
CONFIG_PACKAGE_nfs-utils=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_qemu-x86_64-softmmu=y
CONFIG_PACKAGE_qemu-bridge-helper=y
CONFIG_PACKAGE_kmod-kvm-intel=y
CONFIG_PACKAGE_pimbd=y
CONFIG_PACKAGE_atftp=y
# Enable menus
CONFIG_DEVEL=y
CONFIG_IMAGEOPT=y
CONFIG_VERSIONOPT=y
# Build options
CONFIG_INCLUDE_CONFIG=y
CONFIG_VERSION_FILENAMES=y
CONFIG_COLLECT_KERNEL_DEBUG=n" > .config
make defconfig && ./scripts/diffconfig.sh | tee .config.diff
echo "# Compiling..."
time make -j32
echo "# Done."
