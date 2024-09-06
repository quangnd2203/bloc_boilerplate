part of 'theme_cubit.dart';

class ThemeState extends IThemeState{
  const ThemeState({required super.mode, required super.lightTheme, required super.darkTheme});

  @override
  ThemeState copyWith({ThemeMode? mode, ThemeData? lightTheme, ThemeData? darkTheme}) {
    return ThemeState(
      mode: mode ?? this.mode,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  @override
  List<Object?> get props => <Object>[mode, lightTheme, darkTheme];
}
