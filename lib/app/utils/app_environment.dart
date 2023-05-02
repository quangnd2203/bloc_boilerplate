import '../constants/constants.dart';

class AppEnvironment {
  AppEnvironment._();

  static String getBaseUrlByEnvironment() {
    switch (FLAVOR) {
      case 'dev':
        return AppEndpoint.BASE_URL_DEV;
      case 'prod':
        return AppEndpoint.BASE_URL_PROD;
      case 'staging':
        return AppEndpoint.BASE_URL_STAGING;
      default:
        return '';
    }
  }

  static Map<String, String> getBaseHeader() {
    final Map<String, String> defaultHeader = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json'
    };

    late Map<String, String> optionalHeader;

    switch (FLAVOR) {
      case 'dev':
        optionalHeader = <String, String>{};
        break;
      case 'prod':
        optionalHeader = <String, String>{};
        break;
      default:
        optionalHeader = <String, String>{};
    }

    defaultHeader.addAll(optionalHeader);
    return defaultHeader;
  }
}
