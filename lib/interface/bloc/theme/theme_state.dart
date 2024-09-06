part of 'theme_cubit.dart';

abstract class IThemeState extends Equatable{
  const IThemeState({required this.mode, required this.lightTheme, required this.darkTheme});

  final ThemeMode mode;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  @override
  IThemeState copyWith({ThemeMode? mode, ThemeData? lightTheme, ThemeData? darkTheme});

  @override
  List<Object?> get props => <Object>[mode, lightTheme, darkTheme];
}
