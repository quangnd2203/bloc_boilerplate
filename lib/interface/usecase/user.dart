import '../../infrastructure/model/network_state.dart';
import '../../domain/entity/page.dart';
import '../../domain/entity/user.dart';

abstract class IUserUseCase{
  Future<NetworkState<PageEntity<UserEntity>>> getAll(num limit, num offset);
  Future<NetworkState<UserEntity>> get(String id);
}