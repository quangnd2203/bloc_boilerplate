import '../../app/resources/model/model.dart';
import '../../infrastructure/model/page.dart';
import '../../infrastructure/model/user.dart';

abstract class IUserRepository{
  Future<NetworkState<PageModel<UserModel>>> getAlls(num page, num limit);
  Future<NetworkState<UserModel>> get(String id);
}