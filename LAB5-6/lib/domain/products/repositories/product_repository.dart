import 'package:laborator_5/domain/products/entities/index.dart';

abstract class ProductRepository {
  Future<List<DomainProduct>> getProductsApi(int page);
}
