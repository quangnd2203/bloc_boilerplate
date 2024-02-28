// ignore_for_file: avoid_dynamic_calls, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageSelectState extends Equatable {

  LanguageSelectState({this.imageUrl, this.languageName, this.languageCode, this.countryCode});

  factory LanguageSelectState.fromJson(dynamic json) {
    return LanguageSelectState(
      imageUrl: json['imageUrl'] as String?,
      languageName: json['languageName'] as String?,
      languageCode: json['languageCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );
  }
  String? imageUrl;
  String? languageName;
  String? languageCode;
  String? countryCode;

  Locale get locale => Locale(languageCode!, countryCode);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'languageName': languageName,
      'languageCode': languageCode,
      'countryCode': countryCode,
    };
  }

  @override
  List<Object?> get props => <Object?>[
        languageCode,
        countryCode,
      ];
}
