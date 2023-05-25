import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    required this.url,
    this.width = 720,
    this.height = 720,
    this.borderRadius = 0,
    this.fit = BoxFit.fitWidth,
    this.errorBuilder,
    this.placeholderBuilder,
    this.onImageBuilder,
    this.useOldImageOnUrlChange = true,
  });
  final String url;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Widget Function(BuildContext context, String url, dynamic error)? errorBuilder;
  final Widget Function(BuildContext context, String url)? placeholderBuilder;
  final Function(BuildContext context, ImageProvider<Object> imageProvider)? onImageBuilder;
  final bool useOldImageOnUrlChange;

  static String placeholder({int width = 720, int height = 720, String text = 'No Image'}) =>
      'https://via.placeholder.com/${width}x$height.png?text=$text';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      color: Colors.white,
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) {
        if (onImageBuilder != null) {
          onImageBuilder!(context, imageProvider);
        }
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: placeholderBuilder ??
          (BuildContext context, String url) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      errorWidget: errorBuilder ??
          (BuildContext context, String url, dynamic error) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: AppColors.borderLight),
                  image: DecorationImage(
                    image: AssetImage(AppImages.png('error')),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
    );
  }
}
