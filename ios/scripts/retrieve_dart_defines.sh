#!/bin/sh

# Dart-defineを書き込んだり、Flavorごとのxcconfigをincludeするファイル
OUTPUT_FILE="${SRCROOT}/Flutter/DartDefines.xcconfig"

# Flutter 2.2 以降で必要な、Dart-Definesのデコード処理
function decode_url() { echo "${*}" | base64 --decode; }

# 最初にファイル内容をいったん空にする
: > $OUTPUT_FILE

IFS=',' read -r -a define_items <<<"$DART_DEFINES"
oilerplate
for index in "${!define_items[@]}"
do
    # Flutter 2.2 以降で必要なデコードを実行する
    item=$(decode_url "${define_items[$index]}")
    # FLAVORが含まれるDart Defineの場合
    if [ $(echo $item | grep 'FLAVOR') ] ; then
        # FLAVORの値(=の右側)
        value=${item#*=}
        # FLAVORに対応したXCConfigファイルをincludeさせる
        echo "#include \"$value.xcconfig\"" >> $OUTPUT_FILE
        echo "identifier=com.quangnd.getxboilerplate" >> $OUTPUT_FILE
        echo "PRODUCT_BUNDLE_IDENTIFIER=\$(identifier)\$(APP_ID_SUFFIX)" >> $OUTPUT_FILE
        echo "APP_LINK=applinks:getxboilerplate\$(APP_LINK_SUFFIX).page.link" >> $OUTPUT_FILE
    fi
done