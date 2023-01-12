import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:laborator_5/presentation/app/controller/api_categories_controller.dart';

class BuildCategories extends StatelessWidget {
  const BuildCategories({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.find();

    return Scaffold(
      body: Obx(
          () => ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: apiController.products.length,
                itemBuilder: (context, index){
                  final products = apiController.products[index];
                  return Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(blurRadius: 5, color: Color(0x00F4F4F4), spreadRadius: 2)],
                          ),
                          child: Image.network(
                            products.category.icon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 60,
                          child: Text(
                            products.category.name,
                            style: const TextStyle(
                                fontSize: 12
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) => const SizedBox(
                width: 18,
              ),
              )
      ),
    );
  }
}