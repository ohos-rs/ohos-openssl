## ohos-openssl-binding

This project's goal is to provide the precompiled binary of `openssl` in `OpenHarmony`

## Supported architectures
- arm64-v8a
- armeabi-v7a
- x86_64

## Usage


```shell
git clone https://github.com/ohos-rs/ohos-openssl.git
```

### openssl-sys

For the crate `openssl-sys`, you can use it like be here:

```shell
# for arm64-v8a
export AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_INCLUDE_DIR=/ohos-openssl/prelude/arm64-v8a/include
export AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_LIB_DIR=/ohos-openssl/prelude/arm64-v8a/lib
```