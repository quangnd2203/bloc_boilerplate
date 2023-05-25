part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.mode, required this.lightTheme, required this.darkTheme});

  final ThemeMode mode;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

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
