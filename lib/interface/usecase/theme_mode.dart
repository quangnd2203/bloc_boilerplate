import 'package:flutter/material.dart';

abstract class IThemeModeUseCase{
  void update(ThemeMode mode);
  Future<ThemeMode?> get();
}
