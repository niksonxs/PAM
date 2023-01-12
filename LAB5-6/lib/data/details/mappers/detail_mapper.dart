import 'package:laborator_5/data/details/mappers/reviews_mapper.dart';

import 'package:laborator_5/domain/details/entities/index.dart';
import 'package:laborator_5/data/products/mappers/category_mapper.dart';
import 'package:laborator_5/data/details/models/index.dart';
import 'image_mapper.dart';

class DetailMapper {
  static ProductDetailEntity mapApiToModel(DetailApiDto input) {
    return ProductDetailEntity(
      category: CategoryMapper.mapApiToModel(input.category),
      name: input.name,
      size: input.size,
      colour: input.colour,
      mainImage: input.mainImage,
      price: input.price,
      details: input.details,
      id: input.id,
      reviews:  input.reviews.map((el)=>ReviewMapper.mapApiToModel(el)).toList(),
      images:  input.images.map((el)=>ImageMapper.mapApiToModel(el)).toList(),
    );
  }
}
