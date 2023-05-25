// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
//
// class ThemeSwitcher extends InheritedWidget {
//
//   const ThemeSwitcher({super.key, required this.data, required super.child});
//   final _ThemeSwitcherWidgetState data;
//
//   static _ThemeSwitcherWidgetState of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()!.data;
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return this != oldWidget;
//   }
// }
//
// class ThemeSwitcherWidget extends StatefulWidget {
//
//   const ThemeSwitcherWidget(
//       {super.key, required this.child, required this.initialThemeData});
//   final Widget child;
//   final ThemeData initialThemeData;
//
//   @override
//   _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
// }
//
// class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
//   ThemeData? themeData;
//
//   void switchMode({ThemeData? themeData}) {
//     setState(() {
//       if (themeData != null){
//         this.themeData = themeData;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     themeData = themeData ?? widget.initialThemeData;
//     return ThemeSwitcher(
//       data: this,
//       child: widget.child,
//     );
//   }
// }
