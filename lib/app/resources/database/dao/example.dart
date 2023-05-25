// import '../../resources.dart';
//
// class UserDao implements Dao<UserModel>{
//
//   factory UserDao() {
//     return _instance ??= UserDao._();
//   }
//   UserDao._();
//
//   static UserDao? _instance;
//
//   /// Khởi tạo AppDataBase để có thể thao tác với Backendless
//
//   @override
//   AppDataBase appDatabase = AppDataBase();
//
//   /// Gán tên của bảng trên Backendless vào đây.
//   @override
//   String tableName = 'User';
//
//   /// Phương thức này dùng để query CSDL trả ra List<UserModel>
//   ///
//   /// Cac biến:
//   ///   queryBuilder: điều kiện đầu vào (có thể có hoặc không).
//   @override
//   Future<List<UserModel>> read({DataQueryBuilder? queryBuilder}) async {
//     List<UserModel> result = <UserModel>[];
//     final List<Map<dynamic, dynamic>?>? response = await appDatabase.read(tableName, queryBuilder: queryBuilder);
//     if(response != null){
//       result = response.map<UserModel>((Map<dynamic, dynamic>? e) => UserModel.fromJson(Map<String, dynamic>.from(e!))).toList();
//     }
//     return result;
//   }
//
//   @override
//   Future<UserModel?> save({required Map<String, dynamic> data, bool isUpsert = false}) async {
//     UserModel? result;
//     final Map<dynamic, dynamic>? response = await appDatabase.save(tableName, data: data, isUpsert: isUpsert);
//     if(response != null){
//       result = UserModel.fromJson(Map<String, dynamic>.from(response));
//     }
//     return result;
//   }
//
//   @override
//   Future<int> update({required String whereClause, required Map<String, dynamic> data}) async {
//     final int? response = await appDatabase.update(tableName, whereClause: whereClause, data: data);
//     return response ?? 0;
//   }
//
// }
