# ren
An app to give and take products for rent

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## App Icon
To generate app icon we are using **flutter_launcher_icons**, Refer this link to update app icon https://pub.dev/packages/flutter_launcher_icons

## App release
- [Android](https://docs.flutter.dev/deployment/android)
- [iOS](https://docs.flutter.dev/deployment/ios)


## To open emulators
- List android emulators `emulator -list-avds`
- To run android emulator `emulator -avd avd_name [ {-option [value]} … ]`
- To run ios emulator `open -a Simulator`

## To run app
**NOTE:** Before running below command, run emulators
`flutter run`

## To run tests
`flutter test`

## To build app bundle
**NOTE:** We have to update build number everytime we generate aab file, otherwise google play console will not accept the aab file
`flutter build appbundle --build-name=x.x.x --build-number=x`

## To build apk
`flutter build apk --split-per-abi --build-name=x.x.x --build-number=x`

## App splash screen
To generate splash screen we are using **flutter_native_splash**
If you want to change splash screen update color and image values in **pubspec.yml** under **flutter_native_splash**
then run `flutter_native_splash:create`

## App name
To set app name we are using **flutter_app_name**
If you want to change app name, Then update name value under **flutter_app_name** in **pubspec.yml**
then run `flutter pub run flutter_app_name`

## Auto route
We are using https://pub.dev/packages/auto_route package to generate routes
after adding routets to routes.dart run `flutter packages pub run build_runner build` to auto generate code