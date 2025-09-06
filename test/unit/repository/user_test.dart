import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:flutter_app/domain/interface/client/client.dart';
import 'package:flutter_app/adapter/repository/user_repository.dart';
import 'package:flutter_app/adapter/model/user.dart';
import 'package:flutter_app/adapter/model/network_state.dart';
import 'package:flutter_app/shared/constants/app_endpoint.dart';

// 👉 Khai báo generate mock
@GenerateMocks([IClient])
void main() {}