
import '../../resources/repository/auth_repository.dart';
import '../ui.dart';

class SplashController extends BaseController {
  final AuthRepository authRepository = AuthRepository();
  
  @override
  void onInit() {
    super.onInit();
    // initial();
  }

  // Future<void> initial() async {
  //   await Future<dynamic>.delayed(const Duration(seconds: 1));
  //   final NetworkState<UserResponse> networkState = await authRepository.authentication();
  //   _saveUserInfo(user: networkState.data, token: networkState.isSuccess ? AppPrefs.accessToken : null);
  //   if (networkState.isSuccess) {
  //     Get.offAllNamed(Routes.DASH_BOARD);
  //   } else {
  //     Get.offAllNamed(Routes.LOGIN);
  //   }
  // }

  // void _saveUserInfo({UserResponse? user, String? token}) {
  //   AppPrefs.accessToken = token;
  //   AppPrefs.userInfo = user;
  //   AppPrefs.userRole = user?.authority;
  // }
}
