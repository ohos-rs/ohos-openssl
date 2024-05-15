#!/bin/sh

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
        make clean && \
        popd
    else
        echo "Failed to source script for ${arch}"
        exit
    fi
}

build_architecture "arm64-v8a" "linux-aarch64"

build_architecture "armeabi-v7a" "linux-generic32"

build_architecture "x86_64" "linux-x86_64"