import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laborator_5/presentation/app/controller/api_categories_controller.dart';
import 'package:laborator_5/presentation/app/controller/detail_controller.dart';
import 'package:laborator_5/presentation/app/page/productPage.dart';

class BuildProducts extends StatelessWidget {
  const BuildProducts({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.find();
    DetailController aboutProductController = Get.find();

    return Scaffold(
      body: Obx(
              () => GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 28,
                    crossAxisCount: 2,
                    mainAxisExtent: 341,
                  ),
                  itemCount: apiController.products.length,
                  itemBuilder: (context, index){
                    final products = apiController.products[index];
                    return GestureDetector(
                        onTap: () async {
                          await aboutProductController.getDetails(products.id);
                          Get.to(const ProductPage());
                        },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  products.mainImage,
                                  height: 240,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: SvgPicture.asset(
                                      'lib/presentation/resources/svg/star.svg',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            products.name,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            products.details,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF929292),
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            softWrap: true,
                          ),
                          const Spacer(),
                          Text(
                            '\$${products.price}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF00C569),
                            ),
                          ),
                        ],
                      )
                    );
                  }
              )
      ),
    );
  }
}