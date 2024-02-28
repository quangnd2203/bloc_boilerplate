class AppEndpoint {
  AppEndpoint._();

  // static const String BASE_URL_DEV = '';
  // static const String BASE_URL_STAGING = '';
  // static const String BASE_URL_PROD = '';
  static const String BASE_URL = 'https://mylinks.com.vn/vivi';
  static const String BRAND_IMAGE_URL = 'https://mylinks.com.vn/vivi/storage/app/public/dbserver';
  static const String API_KEY = 'O5my8JAR4D5CGVKppScL8KMBhlN_KfVn';

  static const String TEST_API = 'https://jsonplaceholder.typicode.com/posts';

  static const String SERVER_CATEGORIES = '/api/v1/get-server-category';
  static const String SERVER_LIST = '/api/v1/server-list';

  static const String LOGIN = '/api/v1/customer/auth/login';
  static const String CHECK_PHONE = '/api/v1/customer/auth/check-phone';
  static const String RESEND_OTP = '/api/v1/customer/auth/resend-otp';
  static const String VERIFY_PHONE_NUMBER_OTP = '/api/v1/customer/auth/verify-phone';
  static const String REGISTER = '/api/v1/customer/auth/register';
  static const String SEND_OTP_FORGOT_PASSWORD = '/api/v1/customer/auth/forgot-password';
  static const String VERIFY_OTP_FORGOT_PASSWORD = '/api/v1/customer/auth/verify-token';
  static const String RESET_PASSWORD = '/api/v1/customer/auth/reset-password';
  static const String CHANGE_PASSWORD = '/api/v1/customer/change-pin';
  static const String GET_PROFILE = '/api/v1/customer/get-customer';
  static const String UPDATE_PROFILE = '/api/v1/customer/update-profile';
  static const String LOGOUT = '/api/v1/customer/logout';
  static const String DELETE_ACCOUNT = '/api/v1/customer/remove-account';
  static const String GET_STATES = '/api/v1/states';
  static const String GET_CITIES = '/api/v1/cities';
  static const String UPDATE_FCM = '/api/v1/customer/update-fcm-token';

  static const String GET_CONFIG = '/api/v1/config';

  static const String GET_MESSAGE_UNREAD_COUNT = '/api/v1/customer/unread-message-count';
  static const String GET_MESSAGE = '/api/v1/customer/get-messages';
  static const String READ_MESSAGE = '/api/v1/customer/read-message';

  static const String GET_MY_LIST_MERCHANT = '/api/v1/customer/get-my-merchant';
  static const String GET_MERCHANT_INFO = '/api/v1/customer/get-merchant-info';
  static const String GET_MERCHANT_DETAIL = '/api/v1/customer/get-merchant-detail';
  static const String GET_MERCHANT_CATEGORY = '/api/v1/customer/get-merchant-category';
  static const String GET_MERCHANT_NEWS_CATEGORY = '/api/v1/customer/get-news-category';
  static const String LIKE_MERCHANT = '/api/v1/customer/like-merchant';
  static const String SUBCRIPTION_MERCHANT = '/api/v1/customer/subcription-merchant';
  static const String GET_MERCHANT_NEWS = '/api/v1/customer/get-news-all';
  static const String RATING_MERCHANT = '/api/v1/customer/rating-merchant';
  static const String GET_MERCHANT_QR = '/api/v1/customer/share-qrcode';

  static const String GET_BANNER = '/api/v1/customer/get-banner';
  static const String GET_TRANSACTION_HISTORY = '/api/v1/customer/transaction-history';

  static const String SCAN_QRTOKEN = '/api/v1/customer/scan-qrtoken';
  static const String SCAN_SHARE_QRTOKEN = '/api/v1/customer/scan-share-qrtoken';

  static const String GET_PURPOSE = '/api/v1/customer/get-purpose';
  static const String SEND_MONEY = '/api/v1/customer/send-money';
  static const String REQUEST_MONEY = '/api/v1/customer/request-money';
  static const String CASH_OUT = '/api/v1/customer/cash-out';
  static const String PIN_VERIFY = '/api/v1/customer/verify-pin';

  static const String CHECK_CUSTOMER_PHONE = '/api/v1/check-customer';
  static const String CHECK_AGENT_PHONE = '/api/v1/check-agent';

  static const String GET_WITHDRAW_METHODS = '/api/v1/customer/withdrawal-methods';
  static const String WITHDRAW = '/api/v1/customer/withdraw';

  static const String GET_QRCODE_TOKEN = '/api/v1/customer/get-qrtoken';
  static const String GET_WITHDRAW_HISTORY = '/api/v1/customer/withdrawal-requests';
  static const String GET_REQUEST_HISTORY = '/api/v1/customer/get-requested-money';
  static const String GET_OWNER_REQUEST_HISTORY = '/api/v1/customer/get-own-requested-money';
  static const String ACCEPTED_REQUEST_MONEY = '/api/v1/customer/request-money/approve';
  static const String DENIED_REQUEST_MONEY = '/api/v1/customer/request-money/deny';
  static const String UPDATE_KYC_INFORMATION = '/api/v1/customer/update-kyc-information';

  static const String GET_FAQ = '/api/v1/faq';

  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const String keyAuthorization = 'Authorization';

  static const int SUCCESS = 200;
  static const int UNAUTHORIZED = 401;
  static const int BAD_REQUEST = 400;
  static const int NOT_FOUND = 404;
  static const int FORBIDDEN = 403;
  static const int TOO_MANY_REQUEST = 429;

  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

}
