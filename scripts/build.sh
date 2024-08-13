#!/bin/sh

patch_file="${PWD}/patchs/openssl.patch"

pushd "openssl"
git apply "${patch_file}"
popd

build_architecture() {
    local arch=$1
    local openssl_arch=$2
    local script_path="${PWD}/scripts/${arch}.sh"
    local output_dir="${PWD}/prelude/${arch}"
    local extra_args=""

    if [ "$arch" = "armeabi-v7a" ]; then
        extra_args="-D__ARM_MAX_ARCH__=8"
    fi

    echo "Start to build ${arch}"
    if source "${script_path}"; then
        pushd "openssl"
        make clean && \
        ./Configure ${openssl_arch} --prefix="${output_dir}" --libdir=lib ${extra_args} && \
        make && \
        make install && \
        popd
    else
        echo "Failed to source script for ${arch}"
        exit
    fi
}

build_architecture "arm64-v8a" "ohos-aarch64"

build_architecture "armeabi-v7a" "ohos-arm"

build_architecture "x86_64" "ohos-x86_64"

pushd "openssl"
git apply --reverse "${patch_file}"
popd
