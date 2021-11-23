#!/bin/bash
set -eo pipefail

if [ ! -f ./u-boot/Makefile ]; then
    git submodule update --init
fi

pushd u-boot

export CROSS_COMPILE=aarch64-unknown-linux-gnu-
export BL31=../bl31.bin
export SCP=../scp.bin
export ARCH=arm64
make pinephone_defconfig
make u-boot-sunxi-with-spl.bin -j$(nproc)

popd
cp ./u-boot/u-boot-sunxi-with-spl.bin ./
