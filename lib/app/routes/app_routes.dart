part of './app_pages.dart';

abstract class Routes {
  static const String SPLASH = '/';

  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String OTP = '/otp';
  static const String REGISTER_INFO = '/register_info';
  static const String REGISTER_PIN = '/register_pin';
  static const String FORGOT_PASSWORD = '/forgot_password';
  static const String FORGOT_PASSWORD_PIN = '/forgot_password_pin';
  static const String GETTING = '/getting';
  static const String LANGUAGE = '/language';
  static const String SELECT_SERVER = '/select_server';
  static const String DASHBOARD = '/dashboard';
  static const String PROFILE_UPDATE = '/profile_update';
  static const String MERCHANT_DETAIL = '/merchant_detail';
  static const String QR_CODE_SCANNER = '/qr_code_scanner';
  static const String TRANSACTION_MONEY = '/transaction_money';
  static const String TRANSACTION_USERS_TRANSFER = '/transaction_users_transfer';
  static const String TRANSACTION_USERS_CASH_OUT = '/transaction_users_cash_out';
  static const String TRANSACTION_USERS_REQUEST = '/transaction_users_request';
  static const String MY_QRCODE = '/my_qrcode';
  static const String WITHDRAW_HISTORY = '/withdraw_history';
  static const String REQUEST_HISTORY = '/request_history';
  static const String OWNER_REQUEST_HISTORY = '/owner_request_history';
  static const String TRANSACTION_HISTORY = '/transaction_history';
  static const String CHANGE_PIN = '/change_pin';
  static const String ABOUT_US = '/about_us';
  static const String POLICY = '/policy';
  static const String TERMS = '/terms';
  static const String FAQ = '/faq';
  static const String SUPPORT = '/support';
  static const String VERIFY_ACCOUNT = '/verify_account';
}
