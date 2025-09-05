import 'package:get/get.dart';

import 'package:flutter_app/adapter/model/network_state.dart';
import 'package:flutter_app/domain/interface/repository/user.dart';
import 'package:flutter_app/domain/entity/page.dart';
import 'package:flutter_app/domain/entity/user.dart';

class UserGetAllUseCase {
  UserGetAllUseCase();

  final IUserRepository _userRepository = Get.find<IUserRepository>();

  Future<NetworkState<PageEntity<UserEntity>>> execute(num limit, num offset) async {
    return _userRepository.getAlls(limit, offset);
  }
}
