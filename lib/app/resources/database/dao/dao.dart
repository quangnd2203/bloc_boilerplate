// import 'package:backendless_sdk/backendless_sdk.dart';
//
// import '../app_database.dart';
//
// export 'package:backendless_sdk/backendless_sdk.dart';
//
// export 'conversation_dao.dart';
//
// abstract class Dao<T>{
//   /// Tên bảng
//   late String tableName;
//
//   /// Lớp AppDataBase để thao tác với CSDL
//   late AppDataBase appDatabase;
//
//   Future<List<T>> read({DataQueryBuilder? queryBuilder});
//
//   Future<T?> save({required Map<String, dynamic> data, bool isUpsert = false});
//
//   Future<int> update({required String whereClause, required Map<String, dynamic> data});
//
//   Future<int> setRelation({required String parentObjectId, required String relationColumnName, List<String>? childrenObjectIds, String? whereClause}) async {
//     final int? response = await appDatabase.setRelation(tableName, parentObjectId: parentObjectId, relationColumnName: relationColumnName, childrenObjectIds: childrenObjectIds, whereClause: whereClause);
//     return response ?? 0;
//   }
//
//   Future<int> deleteRelation({required String parentObjectId, required String relationColumnName, List<String>? childrenObjectIds, String? whereClause}) async {
//     final int? response = await appDatabase.deleteRelation(tableName, parentObjectId: parentObjectId, relationColumnName: relationColumnName, childrenObjectIds: childrenObjectIds, whereClause: whereClause);
//     return response ?? 0;
//   }
// }
