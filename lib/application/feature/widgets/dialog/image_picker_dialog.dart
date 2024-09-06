// // ignore_for_file: use_build_context_synchronously
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../blocs/application/application_cubit.dart';
// import '../../../constants/app_enums.dart';
// import '../../../constants/app_text_styles.dart';
// import '../../../utils/app_camera.dart';
//
// class ImagePickerDialog extends StatelessWidget {
//   const ImagePickerDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Container(
//         width: Get.width * 0.5,
//         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
//         child: Row(
//           children: <Widget>[
//             buildButton(context, ImageSource.camera, Icons.camera_alt),
//             const Spacer(),
//             buildButton(context, ImageSource.gallery, Icons.camera),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildButton(
//     BuildContext context,
//     ImageSource picker,
//     IconData icon,
//   ) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         GestureDetector(
//           onTap: () {
//             onPickImage(context, picker);
//           },
//           child: Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 width: 2,
//                 color: Theme.of(context).primaryColor,
//               ),
//             ),
//             child: Center(
//               child: Icon(
//                 icon,
//                 color: Theme.of(context).primaryColor,
//                 size: 30,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Text(
//           picker.name.tr,
//           textAlign: TextAlign.center,
//           style: AppTextStyles.rubikSemiBold.copyWith(
//             fontSize: 14,
//             color: Theme.of(context).primaryColor,
//           ),
//         )
//       ],
//     );
//   }
//
//   Future<void> onPickImage(BuildContext context, ImageSource picker) async {
//     late final XFile? file;
//     try {
//       if (picker == ImageSource.gallery) {
//         file = await AppCamera().pickImageFromGallery();
//       } else {
//         file = await AppCamera().pickImageFromCamera();
//       }
//       if (file != null) {
//         Navigator.pop(context, File(file.path));
//       }
//     } on AssertionError catch (e) {
//       Get.find<ApplicationCubit>().showSnackbar(e.message.toString().tr, isError: true);
//     } catch (e) {
//       Get.find<ApplicationCubit>().showSnackbar('image_picker_error', isError: true);
//     }
//   }
// }
