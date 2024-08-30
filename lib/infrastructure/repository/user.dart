import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../common/constants/app_endpoint.dart';
import '../model/network_state.dart';
import '../../interface/client/client.dart';
import '../../interface/repository/user.dart';
import '../model/page.dart';
import '../model/user.dart';

class UserRepository implements IUserRepository {
  final IClient _client = getx.Get.find<IClient>();

  @override
  Future<NetworkState<UserModel>> get(String id) async {
    try{
      final Response<dynamic> res = await _client.get(AppEndpoint.USER.replaceAll('{id}', id));
      return NetworkState<UserModel>(
        data: UserModel.fromJson(res.data),
        status: res.statusCode,
      );
    }
    on DioException catch(e){
      return NetworkState<UserModel>.withError(e);
    }
  }

  @override
  Future<NetworkState<PageModel<UserModel>>> getAlls(num page, num limit) async {
    try{
      final Response<dynamic> res = await _client.get(AppEndpoint.USER_GET_ALL, queryParameters: <String, dynamic>{
        'page': page,
        'limit': limit,
      });
      return NetworkState<PageModel<UserModel>>(
        data: PageModel<UserModel>.fromJson(res.data, UserModel.fromJson),
        status: res.statusCode,
      );
    }on DioException catch(e){
      return NetworkState<PageModel<UserModel>>.withError(e);
    }
  }
}
