part of 'theme_cubit.dart';

<<<<<<< HEAD
class ThemeState extends IThemeState{
  const ThemeState({required super.mode, required super.lightTheme, required super.darkTheme});

  @override
=======
class ThemeState extends Equatable{

  final ThemeMode mode;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const ThemeState({required this.mode, required this.lightTheme, required this.darkTheme});

>>>>>>> migration
  ThemeState copyWith({ThemeMode? mode, ThemeData? lightTheme, ThemeData? darkTheme}) {
    return ThemeState(
      mode: mode ?? this.mode,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

<<<<<<< HEAD
  @override
=======
>>>>>>> migration
  List<Object?> get props => <Object>[mode, lightTheme, darkTheme];
}
