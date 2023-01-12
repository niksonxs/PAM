import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laborator_5/presentation/app/controller/api_categories_controller.dart';
import 'package:laborator_5/presentation/app/controller/detail_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  void initState() {
    Get.put(ApiController());
    Get.put(DetailController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DetailController aboutProductController = Get.find();
    var displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: displayWidth,
            padding: const EdgeInsets.only(top: 37),
            constraints: const BoxConstraints.expand(),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: displayWidth,
                          height: 196,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Image.network(
                                aboutProductController.details.value?.mainImage ?? 'image',
                                fit: BoxFit.fitHeight,
                                width: displayWidth,
                              ),
                              Positioned(
                                right: 16,
                                top: 78,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: SvgPicture.asset(
                                      'lib/presentation/resources/svg/star.svg',
                                      color: Colors.black,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 78,
                                child: IconButton(
                                  onPressed: (){
                                    Get.back();
                                  },
                                  icon: SvgPicture.asset(
                                    'lib/presentation/resources/svg/back.svg',
                                    color: Colors.black,
                                    height: 12,
                                    width: 6,
                                  ),
                                  //),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: displayWidth,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    aboutProductController.details.value?.name ?? 'name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 26,
                                    )
                                ),
                                const SizedBox(height: 28),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 160,
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFFEBEBEB),
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Size',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            aboutProductController.details.value?.size == 'XS' ? 'XS' :
                                            aboutProductController.details.value?.size == 'S' ? 'S' :
                                            aboutProductController.details.value?.size == 'M' ? 'M' :
                                            aboutProductController.details.value?.size == 'L' ? 'L' :
                                            aboutProductController.details.value?.size == 'XL' ? 'XL' :
                                            aboutProductController.details.value?.size == 'XXL' ? 'XXL' : 'N/A',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 160,
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFFEBEBEB),
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Colour',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            aboutProductController.details.value?.colour ?? 'colour',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 36),
                                const Text(
                                    'Details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  aboutProductController.details.value?.details ?? 'details',
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                    'Read More',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xFF00C569)
                                    )
                                ),
                                const SizedBox(height: 44),
                                const Text(
                                    'Reviews',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    )
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                    'Write your',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xFF00C569)
                                    )
                                ),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: aboutProductController.details.value?.reviews.length ?? 0,
                                  itemBuilder: (context, index){
                                    final review = aboutProductController.details.value?.reviews[index];
                                    return Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(23),
                                            child: SizedBox(
                                              height: 46,
                                              width: 46,
                                              child: Image.network(
                                                review?.image ?? 'review image',
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return Image.asset('lib/presentation/resources/img/user_placeholder.png');
                                                }
                                              ),
                                            )
                                        ),
                                        const SizedBox(width: 32),
                                        Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 160,
                                                      child: RichText(
                                                        overflow: TextOverflow.fade,
                                                        strutStyle: const StrutStyle(fontSize: 12),
                                                        text: TextSpan(
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 14,
                                                              color: Colors.black
                                                          ),
                                                          text: '${review?.firstName} ${review?.lastName}'),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 123,
                                                      alignment: Alignment.centerRight,
                                                      child: ListView.separated(
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: review?.rating ?? 0,
                                                        itemBuilder: (context, index){
                                                          return SvgPicture.asset(
                                                            'lib/presentation/resources/svg/rating_star.svg',
                                                            height: 15,
                                                            width: 15,
                                                          );
                                                        },
                                                        separatorBuilder: (context, index) => const SizedBox(width: 11),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                Text(
                                                  review?.message ?? 'review message',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                  )
                                                )
                                              ],
                                            )
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 32),
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 84,
                  width: displayWidth,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFF4F4F4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                'PRICE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF929292),
                                )
                            ),
                            const Spacer(),
                            Text(
                                '\$${aboutProductController.details.value?.price ?? 'price'}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF00C569),
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 52,
                        width: 146,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00C569),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                            'ADD',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            )
                        ),
                      )
                    ],
                  ),
                )
              ]
            )
        )
    );
  }
}