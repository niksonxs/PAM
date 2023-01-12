import 'package:laborator_5/domain/products/entities/index.dart';
import 'package:laborator_5/domain/products/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;
  GetProductsUseCase(this.productRepository);

  Future<List<DomainProduct>> call(int page) {
    return productRepository.getProductsApi(page);
  }
}
