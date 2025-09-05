import 'package:flutter_app/adapter/model/network_state.dart';
import 'package:flutter_app/adapter/model/page.dart';
import 'package:flutter_app/adapter/model/user.dart';


abstract class IUserRepository{
  Future<NetworkState<PageModel<UserModel>>> getAlls(num page, num limit);
  Future<NetworkState<UserModel>> get(String id);
}
