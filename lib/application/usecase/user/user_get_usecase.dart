import 'package:get/get.dart';

import 'package:flutter_app/adapter/model/network_state.dart';
import 'package:flutter_app/domain/interface/repository/i_user_repository.dart';
import 'package:flutter_app/domain/entity/user.dart';

class UserGetUseCase {
  UserGetUseCase();

  final IUserRepository _userRepository = Get.find<IUserRepository>();

  Future<NetworkState<UserEntity>> execute(String id) async {
    return _userRepository.get(id);
  }
}
