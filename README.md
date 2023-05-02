# ENASPIRATION

A new NTA Flutter project for smartlock.

## Getting Started

Metting:
https://docs.google.com/document/d/1iLPBo1R7S6M34gKRTRJ1acfQUIMGzImhoXIVufZIRDU/edit

WBS:
https://docs.google.com/spreadsheets/d/1e7vzWOFdO4L-K6EWlz_FgeD0LbERHH1x1Dm517g15-4/edit#gid=613559661

Q&A:
https://docs.google.com/spreadsheets/d/11N_-3pxBmVi6KtBXV3bhhSY6NIRT55UNXmpUZkvkRFk/edit#gid=961056355

Folder Project:
https://drive.google.com/drive/u/1/folders/1iTUGQMk0Pz2m_6fsnQ-BhlcgYtogGV20

## Environment:
- Flutter: v3.7.9

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