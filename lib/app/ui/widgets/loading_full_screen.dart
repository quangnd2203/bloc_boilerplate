import 'package:flutter/material.dart';

class LoadingFullScreen extends StatelessWidget {

  const LoadingFullScreen(
      {super.key,
      required this.child,
      this.colorBackground,
      this.colorLoading,
      this.loading = false});
  final Widget child;
  final bool loading;
  final Color? colorBackground;
  final Color? colorLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (loading) _LoadingWidget(colorBackground, colorLoading) else const SizedBox(),
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {

  const _LoadingWidget(this.background, this.colorLoading);
  final Color? background;
  final Color? colorLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? Colors.black12,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
