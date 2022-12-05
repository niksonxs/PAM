import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/home_controller.dart';
import 'package:flutter_shop/resources/colors.dart';
import 'package:flutter_shop/resources/svg_assets.dart';
import 'package:get/get.dart';
import 'widgets/category_widget.dart';
import 'widgets/sections_title.dart';
import 'widgets/product_widget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List prod = [];

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    final HomeController homeController = Get.find();
    homeController.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      body: Container(
        color: CustomColor.whiteSmoke,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: const [
                    SizedBox(
                      height: 48,
                    ),
                    SectionsTitleWidget(
                      left_title: "Categories",
                      right_title: "",
                    ),
                    CategoryWidget(),
                    SectionsTitleWidget(
                      left_title: "Best Selling",
                      right_title: "See all",
                    ),
                    SizedBox(
                      height: 28,
                    ),
                  ],
                );
              }, childCount: 1),
            ),
            Obx(
                    () =>
                    SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 28),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          //mainAxisSpacing: 26,
                          childAspectRatio: 0.67,
                          //mainAxisExtent:0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            // if (index != (apiController.products.length)) {
                            return ProductWidget(
                              title: homeController.products[index].title,
                              img: homeController.products[index].cover,
                              subtitle: homeController.products[index].subtitle,
                              price: homeController.products[index].price,
                              currency: homeController.products[index].currency,
                              icon: SvgAssets.star,
                            );
                            // }
                          },
                          childCount:homeController.products.length
                          ,
                          /*childCount: apiController.isLoadMore.value
                        ? (apiController.products.length + 1)
                        : (apiController.products.length),*/
                        ),
                      ),
                    ))


          ],
        ),
      ),
    );
  }

}