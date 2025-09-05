class UserEntity{
  UserEntity({this.id, this.name});

  String? id;
  String? name;

  UserEntity copyWith({String? id, String? name}){
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
