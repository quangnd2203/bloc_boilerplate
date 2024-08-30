import '../../domain/entity/page.dart';
import '../../interface/mapper/mapper.dart';
import '../model/page.dart';

class PageMapper<T> implements Mapper<PageModel<T>, PageEntity<T>>{

  @override
  PageEntity<T> toEntity(PageModel<T> model) {
    return PageEntity<T>(
      data: model.data,
      total: model.total,
      page: model.page,
      limit: model.limit,
    );
  }

  @override
  PageModel<T> toModel(PageEntity<T> entity) {
    return PageModel<T>(
      data: entity.data,
      total: entity.total,
      page: entity.page,
      limit: entity.limit,
    );
  }

}