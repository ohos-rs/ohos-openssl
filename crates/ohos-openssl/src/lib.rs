use std::env;

pub fn setup() {
    let current_dir = env::current_dir().unwrap();
    let aarch = (&current_dir).parent().unwrap().join("prelude/arm64-v8a/");
    let arm = (&current_dir).parent().unwrap().join("prelude/armeabi-v7a/");
    let x64 = (&current_dir).parent().unwrap().join("prelude/x86_64/");

    env::set_var("AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR", aarch.to_str().unwrap());
    env::set_var("ARMV7_UNKNOWN_LINUX_OHOS_OPENSSL_DIR", arm.to_str().unwrap());
    env::set_var("X86_64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR", x64.to_str().unwrap());

    println!("cargo:warning=hello\n\n\n");

    println!("cargo:rustc-env=AARCH64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR={}", aarch.to_str().unwrap());
    println!("cargo:rustc-env=ARMV7_UNKNOWN_LINUX_OHOS_OPENSSL_DIR={}", arm.to_str().unwrap());
    println!("cargo:rustc-env=X86_64_UNKNOWN_LINUX_OHOS_OPENSSL_DIR={}", x64.to_str().unwrap());
}