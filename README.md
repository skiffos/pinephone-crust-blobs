# crust for PinePhone pre-compiled

This repo contains pre-compiled crust firmware blobs for the pinephone.

The pinephone crust build requires a or1k-linux-musl compiler. Buildroot cannot
(at present) build multiple toolchains at once, and Skiff configures it to
compile software for the Pinephone CPU (arm64). As a workaround, this repo is
downloaded and the blobs used from here.

Uses [crust-firmware/meta] to compile.

Compilation steps:

 - Acquire cross compilers:
   - https://github.com/stffrdhrn/gcc/releases/tag/or1k-10.0.0-20190723
   - 
 - Or using crossdev:
   - crossdev -t arm-linux-musleabi
   - crossdev -t aarch64-linux-musl
   - crossdev -t or1k-linux-musl
 - Init submodules `git submodule update --init`
 - `export CROSS_or1k=/path/to/or1k-linux-musl`
 - `export CROSS_aarch64=/path/to/compiler/aarch64-linux-musl`
 - Build crust: `cd ./crust-meta && make BOARD=pinephone`
 - Copy binaries into this dir: `cp ./crust-meta/u-boot/u-boot-sunxi-with-spl.bin ./bin/`

Compiled from versions:

 - arm-trusted-firmware version crust-20210410
 - crust version 23d6d7
 - u-boot crust version c784be4 (2021-04-15)
 - u-boot version 446a832 https://gitlab.com/pine64-org/u-boot

[crust-firmware/meta](https://github.com/crust-firmware/meta)
