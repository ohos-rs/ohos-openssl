#!/bin/sh

patch_file="${PWD}/patchs/openssl.patch"
pushd "openssl"
git apply "${patch_file}"
make clean || true
popd

build_architecture() {
    local arch=$1
    local openssl_arch=$2
    local script_path="${PWD}/scripts/${arch}.sh"
    local output_dir="${PWD}/prelude/${arch}"


    echo "Start to build ${arch}"
    if source "${script_path}"; then
        pushd "openssl"
        ./Configure ${openssl_arch} --prefix="${output_dir}" --libdir=lib && \
        make && \
        make install && \
        popd
    else
        echo "Failed to source script for ${arch}"
    fi
}

# build_architecture "arm64-v8a" "ohos-aarch64"

# build_architecture "armeabi-v7a" "ohos-arm"

build_architecture "x86_64" "ohos-x86_64"

pushd "openssl"
git apply --reverse "${patch_file}"
popd
