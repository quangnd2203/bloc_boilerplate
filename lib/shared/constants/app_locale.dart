import 'package:flutter/material.dart';

enum AppLocale {
  vi(Locale('vi', 'VN')),
  en(Locale('en', 'US'));

  const AppLocale(this._locale);
  final Locale _locale;
  Locale get value => _locale;
}
