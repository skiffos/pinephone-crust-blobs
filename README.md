# crust for PinePhone pre-compiled

This repo contains pre-compiled crust firmware blobs for the pinephone.

The pinephone crust build requires a or1k-linux-musl compiler. Buildroot cannot
(at present) build multiple toolchains at once, and Skiff configures it to
compile software for the Pinephone CPU (arm64). As a workaround, this repo is
downloaded and the blobs used from here.

Compilation steps:

 - Acquire cross compilers:
   - https://github.com/stffrdhrn/gcc/releases/tag/or1k-10.0.0-20190723
 - Or using crossdev:
   - crossdev -t arm-linux-musleabi
   - crossdev -t aarch64-linux-musl
   - crossdev -t or1k-linux-musl
 - Init submodules `git submodule update --init`
 - Build: "make"

Compiled from versions:

 - arm-trusted-firmware version a1f02f4
 - crust version v0.5
 - u-boot v2021.10 w/ patches

Reference:

 - https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-pinephone
