import 'package:laborator_5/domain/products/entities/index.dart';
import 'package:laborator_5/data/products/models/index.dart';

class CategoryMapper {
  static DomainCategory mapApiToModel(CategoryApiDto input) {
    return DomainCategory(
      name: input.name,
      id: input.id,
      icon: input.icon,
    );
  }
}