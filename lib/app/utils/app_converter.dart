import 'dart:convert';

class AppConverter {
  AppConverter._();

  static dynamic parseSocketData(dynamic input) {
    if (input == null) {
      return input;
    }
    try {
      if (input is String) {
        return jsonDecode(input);
      }
      return jsonDecode(jsonEncode(input));
    } catch (e) {
      return input;
    }
  }
}
