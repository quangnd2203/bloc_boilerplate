import '../../domain/entity/user.dart';

class UserModel extends UserEntity{
  UserModel({super.id, super.name});

  UserModel.fromJson(dynamic json){
    id = json['id'] as String?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  UserModel copyWith({String? id, String? name}){
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
