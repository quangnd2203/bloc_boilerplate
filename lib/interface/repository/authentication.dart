import '../../app/resources/model/model.dart';

abstract class IAuthenticationRepository {
  Future<NetworkState<dynamic>> login(String email, String password);
  Future<NetworkState<dynamic>> logout();
  Future<NetworkState<dynamic>> register(String email, String password);
}