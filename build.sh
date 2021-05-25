#!/bin/bash

set -x
set -e

ARCH=arm64-v8a
DIR=arm64-v8a

cmake -S. \
    -B build-ohos -DOHOS_ARCH=$ARCH \
    -DCMAKE_TOOLCHAIN_FILE="$HW_NDK/build/cmake/ohos.toolchain.cmake" \
    -DCMAKE_INSTALL_PREFIX="D:/Github/openal-soft/install-ohos/${DIR}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBTYPE=STATIC \
    -DALSOFT_EXAMPLES=OFF \
    -DALSOFT_UTILS=OFF \
    -DALSOFT_REQUIRE_OPENSL=ON \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -GNinja 

ninja -C build-ohos
ninja -C build-ohos install
# $HW_NDK/llvm/bin/llvm-strip.exe --strip-debug  install-ohos/arm64-v8a/lib/libopenal.a 
cp -rv install-ohos/arm64-v8a/include/* /d/Github/cocos2d-x-lite/external/ohos/arm64-v8a/include/
cp install-ohos/arm64-v8a/lib/libopenal.a /d/Github/cocos2d-x-lite/external/ohos/arm64-v8a/lib/libopenal.a