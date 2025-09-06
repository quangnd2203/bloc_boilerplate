import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_app/domain/interface/service/i_wifi_service.dart';

class WifiService implements IWifiService {
  final Connectivity connectivity = Connectivity();
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
