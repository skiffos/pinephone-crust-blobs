#!/bin/bash

if [ ! -f ./crust/Makefile ]; then
    git submodule update --init
fi

export CROSS_COMPILE=or1k-linux-musl-
make -C ./crust pinephone_defconfig
make -C ./crust -j$(nproc) scp
mv ./crust/build/scp/scp.bin ./
