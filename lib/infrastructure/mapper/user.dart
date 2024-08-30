import '../../domain/entity/user.dart';
import '../../interface/mapper/mapper.dart';
import '../model/user.dart';

class UserMapper implements Mapper<UserModel, UserEntity> {

  @override
  UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
    );
  }

  @override
  UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
