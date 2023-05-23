import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/review_screen/product_review_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/product/bottom_sheet/bottom_sheet_for_show_price_&_buy_button.dart';
import '../../../../widgets/product/product_color.dart';
import '../../../../widgets/product/product_description.dart';
import '../../../../widgets/product/product_size.dart';
import '../../../../widgets/product/product_stepper/stepper.dart';
import '../../../../widgets/product/slider/product_view_slider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ValueNotifier<int> _currentSliderPageIndex = ValueNotifier(0);
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          appBarTitle: 'Product Details',
          elevation: 0.0,
          isAttachBackground: false),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductViewSlider(
                      currentSliderPageIndex: _currentSliderPageIndex),
                  //ProductViewSlider
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                                child: Text(
                              "Happy new year special deal save 30%",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black),
                            )),
                            SizedBox(
                              width: 50,
                            ),
                            ProductStepper()
                          ],
                        ),
                        SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: const [
                                  Icon(
                                    CupertinoIcons.star_fill,
                                    size: 18,
                                    fill: 1.0,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black38),
                                  )
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const ProductReviewScreen());
                                },
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: primaryColor,
                                      fontSize: 16),
                                ),
                              ),
                              Card(
                                color: primaryColor,
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProductColor(),
                        const SizedBox(
                          height: 10,
                        ),
                        ProductSize(),
                        const SizedBox(
                          height: 20,
                        ),
                        const ProductDescription(
                          productDescription:
                              "It is a long established fact that a reader"
                              " will be distracted by the readable content"
                              " of a page when looking at its layout."
                              " The point of using Lorem Ipsum is that it "
                              "has a more-or-less normal distribution of",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const BottomSheetForShowPriceAndBuyButton(
              productPrice: 1000, itemCount: 1)
        ],
      ),
    );
  }
}
