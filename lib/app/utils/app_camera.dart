// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import 'app_device.dart';
// import 'app_utils.dart';
//
// class AppCamera {
//   factory AppCamera() {
//     return _instance ??= AppCamera._();
//   }
//   AppCamera._();
//
//   static AppCamera? _instance;
//
//   final ImagePicker imagePicker = ImagePicker();
//
//   Future<XFile?> pickImageFromCamera() async {
//     await AppUtils.requestPermission(<Permission>[Permission.camera]);
//     assert(await Permission.camera.isGranted, 'camera_permission_required');
//     final XFile? file = await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
//     return file;
//   }
//
//   Future<XFile?> pickImageFromGallery() async {
//     late final Permission permission;
//     if (AppDeviceInfo.isIOS) {
//       permission = Permission.photos;
//     } else {
//       permission = Permission.mediaLibrary;
//     }
//     await AppUtils.requestPermission(<Permission>[permission]);
//     assert(await permission.isGranted || await permission.isLimited, 'gallery_permission_required');
//     final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
//     return file;
//   }
//
//   Future<List<XFile>> pickMultiImagesFromGallery([int imageQuality = 50]) async {
//     late final Permission permission;
//     if (AppDeviceInfo.isIOS) {
//       permission = Permission.photos;
//     } else {
//       permission = Permission.mediaLibrary;
//     }
//     await AppUtils.requestPermission(<Permission>[permission]);
//     assert(await permission.isGranted || await permission.isLimited, 'gallery_permission_required');
//     final List<XFile> file = await imagePicker.pickMultiImage(imageQuality: 50);
//     return file;
//   }
// }
