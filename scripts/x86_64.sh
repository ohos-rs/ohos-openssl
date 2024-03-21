#!/bin/sh
export CC=$OHOS_NDK_HOME/native/llvm/bin/clang \
export CXX=$OHOS_NDK_HOME/native/llvm/bin/clang++ \
export AR=$OHOS_NDK_HOME/native/llvm/bin/llvm-ar \
export AS=$OHOS_NDK_HOME/native/llvm/bin/llvm-as \
export LD=$OHOS_NDK_HOME/native/llvm/bin/ld.lld \
export STRIP=$OHOS_NDK_HOME/native/llvm/bin/llvm-strip \
export RANLIB=$OHOS_NDK_HOME/native/llvm/bin/llvm-ranlib \
export OBJDUMP=$OHOS_NDK_HOME/native/llvm/bin/llvm-objdump \
export OBJCOPY=$OHOS_NDK_HOME/native/llvm/bin/llvm-objcopy \
export NM=$OHOS_NDK_HOME/native/llvm/bin/llvm-nm \
export CFLAGS="-target x86_64-linux-ohos --sysroot=${OHOS_NDK_HOME}/native/sysroot -D__MUSL__" \
export CXXFLAGS="-target x86_64-linux-ohos --sysroot=${OHOS_NDK_HOME}/native/sysroot -D__MUSL__" \
