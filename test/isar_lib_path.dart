import 'dart:ffi';

String get getIsarLibPath {
  /// This function returns the path of the Isar library according to the current platform
  ///
  /// You can find the Isar libraries in this url:
  /// https://github.com/isar/isar/releases/tag/4.0.0-dev.14
  ///
  /// Download the Isar libraries
  /// and change the path of the Isar libraries according to your platform
  ///
  return switch (Abi.current()) {
    Abi.macosArm64 || Abi.macosX64 => 'libisar_macos.dylib',
    Abi.linuxX64 => 'libisar_linux_x64.so',
    Abi.androidX64 => 'libisar_android_x64.so',
    Abi.androidArm64 => 'libisar_android_arm64.so',
    Abi.androidArm => 'libisar_android_armv7.so',
    Abi.windowsX64 => 'isar_windows_x64.dll',

    /// Idk how to use it
    Abi.iosX64 => 'isar.xcframework/ios-arm64_x86_64-simulator',

    /// Idk how to use it
    Abi.iosArm64 => 'isar.xcframework/ios-arm64',
    _ => throw UnsupportedError('Unsupported test platform'),
  };
}
