import 'package:either_dart/either.dart';

import 'package:laborator_5/domain/details/entities/index.dart';
import 'package:laborator_5/domain/details/repositories/detail_repository.dart';

class GetDetailsUseCase {
  final DetailRepository detailRepository;

  GetDetailsUseCase(this.detailRepository);

  Future<Either<Failure, ProductDetailEntity>> call(int id) {
    return detailRepository.getDetailsApi(id);
  }
}
