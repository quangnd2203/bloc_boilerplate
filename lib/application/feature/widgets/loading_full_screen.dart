import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constants/application_loading.dart';
import '../../../interface/bloc/application/application_cubit.dart';


class LoadingFullScreen extends StatelessWidget {
  const LoadingFullScreen({super.key, required this.child, this.colorBackground, this.colorLoading});
  final Widget child;
  final Color? colorBackground;
  final Color? colorLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IApplicationCubit, IApplicationState>(
      bloc: Get.find<IApplicationCubit>(),
      builder: (BuildContext context, IApplicationState state) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            child,
            if (state.loading == ApplicationLoading.loading) _LoadingWidget(colorBackground, colorLoading) else const SizedBox(),
          ],
        );
      },
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
