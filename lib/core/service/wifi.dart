import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../infrastructure/service/wifi.dart';

class WifiService implements IWifiService {
  final Connectivity connectivity = Get.find<Connectivity>();
  StreamSubscription<ConnectivityResult>? _subscription;

  @override
  Future<bool> isConnect() async {
    final ConnectivityResult result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  void onListener(void Function(ConnectivityResult result) callback) {
    _subscription = connectivity.onConnectivityChanged.listen(callback);
  }

  @override
  void removeListener() {
    _subscription?.cancel();
    _subscription = null;
  }
}
