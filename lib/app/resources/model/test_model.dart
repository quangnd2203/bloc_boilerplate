/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

class TestModel {
  TestModel({
      this.userId, 
      this.id, 
      this.title, 
      this.body,});

  TestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int?;
    id = json['id'] as int?;
    title = json['title'] as String?;
    body = json['body'] as String?;
  }
  int? userId;
  int? id;
  String? title;
  String? body;
TestModel copyWith({  int? userId,
  int? id,
  String? title,
  String? body,
}) => TestModel(  userId: userId ?? this.userId,
  id: id ?? this.id,
  title: title ?? this.title,
  body: body ?? this.body,
);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}
