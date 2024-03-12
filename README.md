# Bloc Boilerplate

## Environment:

- FLAVOR: 
    - prod: production env 
    - staging: staging env
    - dev: developer env

## How to run ?
### By cmd:
- Run cmd: flutter pub get  
- Run cmd: flutter run --flavor [FLAVOR]
- Ex: flutter run --flavor FLAVOR=dev
### By Android studio run:
- Run cmd: flutter pub get
- In "run/debug configurations"
- In line "Addition run args" type "flutter run --flavor FLAVOR=[FLAVOR]"
- Done!

## How to build ?
### APK:
- Run cmd: flutter pub get
- Run cmd: flutter build apk --flavor FLAVOR=[FLAVOR]
### AAB (send to GooglePlay):
- Run cmd: flutter pub get
- Run cmd: flutter build appbundle --flavor FLAVOR=[FLAVOR]

[//]: # (### IPA &#40;iOS&#41;:)

[//]: # (- Step 1: )

[//]: # (  + Run cmd: cd ios)

[//]: # (- Step 2:)

[//]: # (  + Run cmd: flutter pub get)

[//]: # (- Step 3:)

[//]: # (  + Run cmd: pod install)

[//]: # (- Step 4:)

[//]: # (  + Run cmd: flutter build ipa --dart-define FLAVOR=[FLAVOR])

[//]: # (  + Open Xcode. In Target select "Runner". Select "Signing & Capabilities". Then, in Signing &#40;Release & Profile&#41; you import A provisioning profile corresponding to your App Bundle ID.)

[//]: # (- Step 5:)

[//]: # (  + In Xcode Topbar, select Product -> Archive.)

[//]: # (  + After done, you select Window -> Organizer. And distribution app.)