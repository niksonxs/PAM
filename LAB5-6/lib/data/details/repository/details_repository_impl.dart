import 'package:either_dart/either.dart';

import 'package:laborator_5/domain/details/entities/index.dart';
import 'package:laborator_5/domain/details/repositories/detail_repository.dart';
import 'package:laborator_5/data/details/data_source/details_api_data_source.dart' hide Failure;

import '../mappers/detail_mapper.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailsApiDataSource detailsApiDataSource;

  DetailRepositoryImpl(this.detailsApiDataSource);

  @override
  Future<Either<Failure, ProductDetailEntity>> getDetailsApi(int id) async {
    try {
      var detailsApi = await detailsApiDataSource.getDetails(id);
      return Right(DetailMapper.mapApiToModel(detailsApi));
    } catch (e) {
      return Left(Failure(e));
    }
  }
}
