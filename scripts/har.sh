#!/bin/bash

script_dir=$(dirname "$0")

script_dir=$(cd "$script_dir" && pwd)

parent_dir=$(dirname "$script_dir")

cd $parent_dir

rm -rf ./package/prelude/
export COPYFILE_DISABLE=true

mkdir -p ./package/prelude/arm64-v8a/lib
cp -r ./prelude/arm64-v8a/include ./package/prelude/arm64-v8a/
cp ./prelude/arm64-v8a/lib/libcrypto.a ./package/prelude/arm64-v8a/lib/libcrypto.a
cp ./prelude/arm64-v8a/lib/libcrypto.so ./package/prelude/arm64-v8a/lib/libcrypto.so
cp ./prelude/arm64-v8a/lib/libssl.a ./package/prelude/arm64-v8a/lib/libssl.a
cp ./prelude/arm64-v8a/lib/libssl.so ./package/prelude/arm64-v8a/lib/libssl.so

mkdir -p ./package/prelude/armeabi-v7a/lib
cp -r ./prelude/armeabi-v7a/include ./package/prelude/armeabi-v7a
cp ./prelude/armeabi-v7a/lib/libcrypto.a ./package/prelude/armeabi-v7a/lib/libcrypto.a
cp ./prelude/armeabi-v7a/lib/libcrypto.so ./package/prelude/armeabi-v7a/lib/libcrypto.so
cp ./prelude/armeabi-v7a/lib/libssl.a ./package/prelude/armeabi-v7a/lib/libssl.a
cp ./prelude/armeabi-v7a/lib/libssl.so ./package/prelude/armeabi-v7a/lib/libssl.so

mkdir -p ./package/prelude/x86_64/lib/
cp -r ./prelude/x86_64/include ./package/prelude/x86_64/
cp ./prelude/x86_64/lib/libcrypto.a ./package/prelude/x86_64/lib/libcrypto.a
cp ./prelude/x86_64/lib/libcrypto.so ./package/prelude/x86_64/lib/libcrypto.so
cp ./prelude/x86_64/lib/libssl.a ./package/prelude/x86_64/lib/libssl.a
cp ./prelude/x86_64/lib/libssl.so ./package/prelude/x86_64/lib/libssl.so

tar -zcvf package.har package/