import 'package:laborator_5/domain/products/entities/index.dart';
import 'package:laborator_5/domain/products/repositories/product_repository.dart';
import 'package:laborator_5/data/products/data_source/products_api_data_source.dart';

import 'package:laborator_5/data/products/mappers/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiDataSource apiDataSource;

  ProductRepositoryImpl(this.apiDataSource );

  @override
  Future<List<DomainProduct>> getProductsApi(int page) async {
    var productsApi = await apiDataSource.getProducts(page);
    return productsApi.map((e) => ProductMapper.mapApiToModel(e)).toList();
  }

}
