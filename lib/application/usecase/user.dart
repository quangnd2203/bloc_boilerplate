import 'package:get/get.dart';

import 'package:flutter_app/adapter/model/network_state.dart';
import 'package:flutter_app/domain/interface/repository/user.dart';
import 'package:flutter_app/domain/entity/page.dart';
import 'package:flutter_app/domain/entity/user.dart';

class UserUseCase{
  final IUserRepository _userRepository = Get.find<IUserRepository>();

  Future<NetworkState<UserEntity>> get(String id) async {
    return _userRepository.get(id);
  }

  Future<NetworkState<PageEntity<UserEntity>>> getAll(num limit, num offset) async {
    return _userRepository.getAlls(limit, offset);
  }

}
