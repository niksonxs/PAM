import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:laborator_5/domain/details/entities/index.dart';
import 'package:laborator_5/domain/details/use_cases/get_details_use_case.dart';

class DetailController extends GetxController {
  Rxn<ProductDetailEntity> details = Rxn<ProductDetailEntity>();
  GetDetailsUseCase getDetailsUseCase = GetIt.instance.get<GetDetailsUseCase>();

  Future<void> getDetails(int id) async {
    var response = await getDetailsUseCase.call(id);
    response.fold((left) {
    }, (right) {
      details.value = right;
    });
  }
}