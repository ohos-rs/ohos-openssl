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

### ohpm

We can use it with ohpm.

#### Install

```shell
ohpm install @ohos-rs/openssl --save-dev
```

#### Setup

Edit your `CMakeLists.txt` in your project and add those code:

```CMakeLists.txt
set(OPENSSL_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules/@ohos-rs/openssl)
set(CMAKE_MODULE_PATH ${OPENSSL_ROOT_PATH})

find_package(OpenSSL REQUIRED)

target_link_libraries(entry PRIVATE OpenSSL::Crypto OpenSSL::SSL)
```

#### Build

You can release package locally. Just run command: 

```shell
bash ./scripts/har.sh
```

It will generate a `.har` package in current path. You can import it with `file` protocol.

### openssl-sys

For the crate `openssl-sys`, you can use it like be here:

```shell
# for arm64-v8a
export AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR="/path/to/ohos-openssl/prelude/arm64-v8a/"
# for armeabi-v7a
export ARMV7_UNKNOWN_LINUX_OHOS_OPENSSL_DIR="/path/to/ohos-openssl/prelude/armeabi-v7a/"
# for x86_64
export X86_64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR="/path/to/ohos-openssl/prelude/x86_64/"
```

### for openssl1.1.1

Use branch [111](https://github.com/ohos-rs/ohos-openssl/tree/111)

## F & Q

### Why isn't there a rust crate?

We can't guarantee that the code will run prior to rust-openssl's build.rs.
