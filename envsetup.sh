#!/usr/bin/env bash

export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export LLVM=1
#export LLVM_IAS=1
#export CC=clang
#export LD=ld.lld

DATE=$(date +%Y%m%d)
export LOCALVERSION=-cypfq-$DATE
export KBUILD_OUTPUT=./out

if [ ! -d $KBUILD_OUTPUT ];then

	mkdir $KBUILD_OUTPUT
fi

export INSTALL_MOD_STRIP=1
export INSTALL_MOD_PATH=./INSTALL_DIR/cypfq/modules
export INSTALL_PATH=./INSTALL_DIR/cypfq/kernel
