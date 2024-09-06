class PageEntity<T> {
  PageEntity({this.data, this.total, this.page, this.limit});

  List<T>? data;
  num? total;
  num? page;
  num? limit;
}
