import 'package:either_dart/either.dart';

import 'package:laborator_5/domain/details/entities/index.dart';

abstract class DetailRepository {
  Future<Either<Failure, ProductDetailEntity>> getDetailsApi(int id);
}

class Failure{
  dynamic error;
  Failure(this.error);
}