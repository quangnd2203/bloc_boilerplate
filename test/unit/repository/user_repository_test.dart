import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

import 'package:flutter_app/domain/interface/client/i_client.dart';
import 'package:flutter_app/adapter/repository/user_repository.dart';
import 'package:flutter_app/adapter/model/user.dart';
import 'package:flutter_app/adapter/model/network_state.dart';
import 'package:flutter_app/shared/constants/app_endpoint.dart';

import 'user_repository_test.mocks.dart'; // import file vừa generate

// 👉 Khai báo generate mock
@GenerateMocks(<Type>[IClient])
void main() {
  late UserRepository repo;
  late IClient mockClient;

  setUp(() {
    getx.Get.reset();
    mockClient = MockIClient();
    getx.Get.put<IClient>(mockClient);
    repo = UserRepository();
  });

  test('get user success', () async {
    when(
      mockClient.get(AppEndpoint.USER.replaceAll('{id}', '444')),
    ).thenAnswer(
      (_) async => Response<dynamic>(
        requestOptions: RequestOptions(path: AppEndpoint.USER.replaceAll('{id}', '444')),
        statusCode: 200,
        data: <String, dynamic>{'id': '444', 'name': 'Marshal'},
      ),
    );

    final NetworkState<UserModel> result = await repo.get('444');
    expect(result.isSuccess, true);
    expect(result.data?.id, '444');
    expect(result.data?.name, 'Marshal');
  });

  test('get user fobidden', () async {
    when(
      mockClient.get(AppEndpoint.USER.replaceAll('{id}', '444')),
    ).thenThrow(DioException(
      requestOptions: RequestOptions(
        path: AppEndpoint.USER.replaceAll('{id}', '444'),
      ),
      response: Response<dynamic>(
        requestOptions: RequestOptions(
          path: AppEndpoint.USER.replaceAll('{id}', '444'),
          data: null,
        ),
        statusCode: 403,
        data: <String, dynamic>{
          'message': 'forbidden message',
        },
      ),
    ));

    final NetworkState<UserModel> result = await repo.get('444');
    expect(result.isSuccess, false);
    expect(result.errorData?['message'], 'forbidden message');
  });
}
