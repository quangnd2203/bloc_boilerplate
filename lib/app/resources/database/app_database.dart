// import 'package:backendless_sdk/backendless_sdk.dart';
// import 'package:flutter/services.dart';
// import 'package:logger/logger.dart' as log;
//
// const String BACKEND_DOMAIN = 'cunningsmell.backendless.app';
// const String APPLICATION_ID = '2D866C83-7891-28FE-FF30-B43753E33600';
// const String ANDROID_API_KEY = 'DDFBE155-F155-4838-BDCE-39CB9863CB89';
// const String IOS_API_KEY = 'F9D52B9A-DB02-41D0-AC1E-ECCD89CFFD11';
// const String JS_API_KEY = '3787406E-DF79-45A3-9D2B-7CFD187C2D1E';
//
// class AppDataBase {
//   factory AppDataBase() {
//     return _instance ??= AppDataBase._();
//   }
//
//   AppDataBase._();
//
//   static AppDataBase? _instance;
//
//   static log.Logger logger = log.Logger();
//
//   /// Hàm này dùng để kết nối với Backendless trả về true nếu kết nối thành công.
//   ///
//   /// Nên dùng lúc mới bắt đầu chạy chương trình.
//   ///
//   /// bool success = await AppDataBase().initDataBase();
//   Future<bool> initDataBase() async {
//     await Backendless.initApp(
//       applicationId: APPLICATION_ID,
//       androidApiKey: ANDROID_API_KEY,
//       iosApiKey: IOS_API_KEY,
//       jsApiKey: JS_API_KEY,
//       customDomain: BACKEND_DOMAIN,
//     );
//     final bool? success = await Backendless.isInitialized();
//     logger.i(true == success
//         ? 'CONNECT DATABASE SUCCESS'
//         : 'CONNECT DATABASE FAILED');
//     return true == success;
//   }
//
//   /// Hàm này dùng để query dữ liệu theo tên bảng và theo điều kiện đầu vào.
//   ///
//   /// Cac biến:
//   ///   tableName: tên của bảng cần query
//   ///   queryBuilder: điều kiện đầu vào (có thể có hoặc không).
//   ///
//   /// Ví dụ: read('HS_SINHVIEN');
//   Future<List<Map<dynamic, dynamic>?>?> read(String tableName,
//       {DataQueryBuilder? queryBuilder}) async {
//     logger.d('FIND: $tableName\nQUERY: ${queryBuilder?.toJson()}');
//     List<Map<dynamic, dynamic>?>? data;
//     try {
//       data = await Backendless.data.of(tableName).find(queryBuilder);
//       logger.i('RESPONSE: $data');
//     } on Exception catch (e) {
//       _handleError(e);
//     }
//     return data;
//   }
//
//   /// Hàm này dùng để lưu đối tượng vào bảng.
//   Future<Map<dynamic, dynamic>?> save(String tableName,
//       {required Map<String, dynamic> data, bool isUpsert = false}) async {
//     logger.d('SAVE: $tableName\nDATA: $data');
//     Map<dynamic, dynamic>? result;
//     try {
//       result =
//           await Backendless.data.of(tableName).save(data, isUpsert: isUpsert);
//       logger.i('RESPONSE: $result');
//     } on Exception catch (e) {
//       _handleError(e);
//     }
//     return result;
//   }
//
//   Future<int?> update(String tableName,
//       {required String whereClause, required Map<String, dynamic> data}) async {
//     logger.d('UPDATE: $tableName\nDATA: $data\nWHERE_CLAUSE: $whereClause');
//     int? success;
//     try {
//       success =
//           (await Backendless.data.of(tableName).update(whereClause, data)) ?? 0;
//       logger.i('RESPONSE: $success');
//     } on Exception catch (e) {
//       _handleError(e);
//     }
//     return success;
//   }
//
//   Future<int?> setRelation(
//     String tableName, {
//     required String parentObjectId,
//     required String relationColumnName,
//     List<String>? childrenObjectIds,
//     String? whereClause,
//   }) async {
//     int? status;
//     try {
//       logger.d('SET_RELATION: $tableName');
//       status = await Backendless.data.of(tableName).setRelation(
//             parentObjectId,
//             relationColumnName,
//             whereClause: whereClause,
//             childrenObjectIds: childrenObjectIds,
//           );
//     } on Exception catch (e) {
//       _handleError(e);
//     }
//     return status;
//   }
//
//   Future<int?> deleteRelation(
//       String tableName, {
//         required String parentObjectId,
//         required String relationColumnName,
//         List<String>? childrenObjectIds,
//         String? whereClause,
//       }) async {
//     int? status;
//     try {
//       logger.d('DELETE_RELATION: $tableName');
//       status = await Backendless.data.of(tableName).deleteRelation(
//         parentObjectId,
//         relationColumnName,
//         whereClause: whereClause,
//         childrenObjectIds: childrenObjectIds,
//       );
//     } on Exception catch (e) {
//       _handleError(e);
//     }
//     return status;
//   }
//
//   /// Hàm này dùng để bắt lỗi khi gọi query các bảng ở trên Backendless hoặc lỗi hệ thống bất ngờ.
//   ///
//   /// BackendlessException: Object errors Backendless định nghĩa.
//   /// PlatformException: Object errors theo bắt lỗi theo từng nền tảng (IOS hoặc Android).
//   void _handleError(Exception e) {
//     if (e is BackendlessException) {
//       logger.e('URL: ${e.uri}/n${e.code} - Error ${e.message}');
//     } else if (e is PlatformException) {
//       logger.e('${e.code} - Error ${e.message}');
//     } else {
//       logger.e('ERROR: $e');
//     }
//     throw e;
//   }
// }
