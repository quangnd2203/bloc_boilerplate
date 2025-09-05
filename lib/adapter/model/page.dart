import 'package:flutter_app/domain/entity/page.dart';

class PageModel<T> extends PageEntity<T>{
  PageModel({super.data, super.total, super.page, super.limit});

  PageModel.fromJson(dynamic json, T Function(dynamic) fromJson) {
    page = json['page'] as num?;
    limit = json['limit'] as num?;
    total = json['total'] as num?;
    data = (json['data'] as List<dynamic>).map(fromJson).toList();
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['data'] = this.data!.map(toJson).toList();
    return data;
  }
}
