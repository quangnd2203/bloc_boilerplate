import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class LoadMoreEmpty extends StatelessWidget {
  const LoadMoreEmpty({super.key, this.fromHome = false, this.title, this.onRefresh});
  final bool fromHome;
  final String? title;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return fromHome ? noDataWidget(context) : SizedBox(height: MediaQuery.of(context).size.height * 0.6, child: noDataWidget(context));
  }

  Padding noDataWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppImages.png('no_data'), width: 150, height: 150),
            const SizedBox(height: 5),
            Text(
              (title ?? 'no_data_found').tr,
              textAlign: TextAlign.center,
              style: AppTextStyles.rubikRegular,
            ),
            const SizedBox(height: 20),
            if(onRefresh != null)
              InkWell(
                onTap: onRefresh,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.refresh,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'refresh'.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.rubikRegular.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
