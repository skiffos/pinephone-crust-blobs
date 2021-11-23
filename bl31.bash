#!/bin/bash

if [ ! -f ./arm-trusted-firmware/Makefile ]; then
    git submodule update --init
fi

make -j8 -C ./arm-trusted-firmware \
     DEBUG=1 \
     PLAT=sun50i_a64 \
     CROSS_COMPILE=aarch64-unknown-linux-gnu- \
     bl31
cp ./arm-trusted-firmware/build/sun50i_a64/debug/bl31.bin ./
