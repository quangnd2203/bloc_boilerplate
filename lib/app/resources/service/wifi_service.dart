import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';


typedef WifiListener = Function(bool enabled);

class WifiService {

  WifiService({WifiListener? listener}) {
    if (_subscription != null){
      _subscription!.cancel();
    }
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (listener != null) {
        listener(result != ConnectivityResult.none);
      }
    });
  }
  StreamSubscription<ConnectivityResult>? _subscription;

  static Future<bool> isConnectivity() async {
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<bool> isDisconnect() async {
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.none;
  }

  void close() {
    _subscription?.cancel();
  }
}
