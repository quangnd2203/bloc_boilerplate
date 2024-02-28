// ignore_for_file: avoid_dynamic_calls

class ErrorBody {
  ErrorBody({
    this.errors,
  });

  factory ErrorBody.fromJson(dynamic json) {
    return ErrorBody(
      errors: json['errors'] != null ? Error.listFromJson(json['errors']) : null,
    );
  }

  List<Error>? errors;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'errors': List<dynamic>.from(errors!.map((Error x) => x.toJson())),
    };
  }
}

class Error {
  Error({
    this.code,
    this.message,
  });

  factory Error.fromJson(dynamic json) => Error(
        code: json['code'] as String?,
        message: json['message'] as String?,
      );

  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'message': message,
    };
  }

  static List<Error> listFromJson(dynamic json) {
    return json.map<Error>((dynamic j) => Error.fromJson(j)).toList() as List<Error>;
  }
}