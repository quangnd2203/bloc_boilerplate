import 'package:connectivity_plus/connectivity_plus.dart';

abstract class IWifiService{
  void onListener(void Function(ConnectivityResult result) callback);
  void removeListener();
  Future<bool> isConnect();
}
