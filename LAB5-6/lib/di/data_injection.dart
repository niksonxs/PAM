import 'package:get_it/get_it.dart';

import 'package:laborator_5/data/details/data_source/details_api_data_source.dart';
import 'package:laborator_5/data/details/repository/details_repository_impl.dart';
import 'package:laborator_5/data/products/data_source/products_api_data_source.dart';
import 'package:laborator_5/data/products/repository/products_repository_impl.dart';
import 'package:laborator_5/domain/details/repositories/detail_repository.dart';
import 'package:laborator_5/domain/products/repositories/product_repository.dart';

Future initData() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<ProductApiDataSource>(() => ProductApiDataSourceImpl());
  getIt.registerLazySingleton<DetailsApiDataSource>(() => DetailsApiDataSourceImpl());

  getIt.registerLazySingleton<ProductRepository>(
          () => ProductRepositoryImpl(getIt.get<ProductApiDataSource>()));

  getIt.registerLazySingleton<DetailRepository>(
          () =>  DetailRepositoryImpl(getIt.get<DetailsApiDataSource>()));
}
