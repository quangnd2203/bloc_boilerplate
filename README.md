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
- Ex: flutter run --flavor dev
### By Android studio run:
- Run cmd: flutter pub get
- In "run/debug configurations"
- In line "Addition run args" type "flutter run --flavor [FLAVOR]"
- Done!

## How to build ?
### APK:
- Run cmd: flutter pub get
- Run cmd: flutter build apk --flavor [FLAVOR]
### AAB (send to GooglePlay):
- Run cmd: flutter pub get
- Run cmd: flutter build appbundle --flavor [FLAVOR]
