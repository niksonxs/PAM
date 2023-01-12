import 'package:laborator_5/domain/details/entities/index.dart';
import 'package:laborator_5/data/details/models/index.dart';

class ImageMapper {
  static DomainImage mapApiToModel(ImageApiDto input) {
    return DomainImage(
        image: input.image
    );
  }
}
