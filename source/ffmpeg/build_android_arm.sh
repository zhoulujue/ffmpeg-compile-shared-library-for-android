#!/bin/bash
export TMPDIR=/Users/michael/ffmpegbuilddir/temp/
NDK=/Users/michael/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-14/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

CPU=arm
PREFIX=/Users/michael/ffmpegbuilddir/ffmpeg-install-dir/arm/
ADDI_CFLAGS="-marm"

function build_one
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--enable-filter=crop \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-doc \
--disable-symver \
--enable-small \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

build_one
