import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:laborator_5/domain/products/entities/index.dart';
import 'package:laborator_5/domain/products/use_cases/get_products_use_case.dart';

class ApiController extends GetxController {
  RxList<DomainProduct> products = RxList();
  RxInt page = 1.obs;
  RxBool isLoadMore = false.obs;

  GetProductsUseCase getProductsUseCase = GetIt.instance.get<GetProductsUseCase>();

  Future<void> getProducts() async {
    isLoadMore.value = true;
    var productResponse = await getProductsUseCase.call(page.value);
    products.addAll(productResponse);

    page++;
    isLoadMore.value = false;
  }
}