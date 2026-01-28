# Leggo (Mobile)

Production-ready Flutter app. It works on my machine.
* **Flutter SDK:** ^3.24.0 (or whatever we're on now)
* **JDK:** 17 (LTS) - *Required for the Gradle toolchain*
* **Android SDK:** `C:/Android/Sdk` (Keep it clean, no spaces in the path)
* **NDK:** `27.3.13750724` (LTS)


* to run for dev use 
flutter run --flavor dev --dart-define=FLAVOR=dev

* for prod
flutter run --flavor dev --dart-define=FLAVOR=prod

* for build release
flutter build appbundle --flavor prod --dart-define=FLAVOR=prod --obfuscate --split-debug-info=symbols --no-tree-shake-icons