import 'package:get/get.dart';

import '../../infrastructure/model/network_state.dart';
import '../../infrastructure/model/user.dart';
import '../../interface/mapper/mapper.dart';
import '../../interface/repository/user.dart';
import '../../interface/usecase/user.dart';
import '../entity/page.dart';
import '../entity/user.dart';

class UserUseCase implements IUserUseCase{
  final IUserRepository _userRepository = Get.find<IUserRepository>();
  final Mapper<UserModel, UserEntity> mapper = Get.find<Mapper<UserModel, UserEntity>>();

  @override
  Future<NetworkState<UserEntity>> get(String id) async {
    return _userRepository.get(id);
  }

  @override
  Future<NetworkState<PageEntity<UserEntity>>> getAll(num limit, num offset) async {
    return _userRepository.getAlls(limit, offset);
  }

}