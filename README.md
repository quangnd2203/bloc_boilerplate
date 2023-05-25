# Bloc Boilerplate

## Environment:

- FLAVOR: 
    - prod: production env 
    - staging: staging env
    - dev: developer env

## How to run ?
### By cmd:
- Run cmd: flutter pub get  
- Run cmd: flutter run --dart-define FLAVOR=[FLAVOR]
- Ex: flutter run --dart-define FLAVOR=dev
### By Android studio run:
- Run cmd: flutter pub get
- In "run/debug configurations"
- In line "Addition run args" type "flutter run --dart-define FLAVOR=[FLAVOR]"
- Done!

## How to build ?
### APK:
- Run cmd: flutter pub get
- Run cmd: flutter build apk --dart-define FLAVOR=[FLAVOR]
### AAB (send to GooglePlay):
- Run cmd: flutter pub get
- Run cmd: flutter build appbundle --dart-define FLAVOR=[FLAVOR]
### IPA (iOS):
- Step 1: 
  + Run cmd: cd ios
- Step 2:
  + Run cmd: flutter pub get
- Step 3:
  + Run cmd: pod install
- Step 4:
  + Run cmd: flutter build ipa --dart-define FLAVOR=[FLAVOR]
  + Open Xcode. In Target select "Runner". Select "Signing & Capabilities". Then, in Signing (Release & Profile) you import A provisioning profile corresponding to your App Bundle ID.
- Step 5:
  + In Xcode Topbar, select Product -> Archive.
  + After done, you select Window -> Organizer. And distribution app.