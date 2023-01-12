import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laborator_5/presentation/app/widget/build_categories_widget.dart';
import 'package:laborator_5/presentation/app/widget/build_products_widget.dart';
import 'package:laborator_5/presentation/app/controller/api_categories_controller.dart';
import 'package:laborator_5/presentation/app/controller/detail_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Get.put(ApiController());
    Get.put(DetailController());
    final ApiController apiController = Get.find();
    apiController.getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15, top: 37+16),
          constraints: const BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Categories',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                height: 90,
                child: BuildCategories(),
              ),
              const SizedBox(
                height: 44,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Best selling',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Expanded(
                child: BuildProducts(),
              )
            ],
          ),
        )
    );
  }
}