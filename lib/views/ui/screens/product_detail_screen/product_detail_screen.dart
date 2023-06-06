import 'dart:developer';

import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/login_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/product_detail_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/review_screen/product_review_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
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
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Color> colors = [];
  List<String> sizes = [];
  Color? _selectedColor;
  String? _selectedProductSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductDetailScreenController>()
          .getProductDetails(productId: widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarTitle: Get.find<ProductDetailScreenController>()
                  .productDetailModel
                  .productDetail
                  ?.first
                  .product
                  ?.title ??
              '',
          elevation: 0.0,
          isAttachBackground: false),
      body: GetBuilder<ProductDetailScreenController>(
          builder: (productDetailScreenController) {
        final productDetails = productDetailScreenController
            .productDetailModel.productDetail?.first;
        colors = getProductColor(color: productDetails!.color.toString());
        sizes = getProductSize(sizes: productDetails.size.toString());

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductViewSlider(
                      productImages: [
                        productDetails.img1 ?? '',
                        productDetails.img2 ?? '',
                        productDetails.img3 ?? '',
                        productDetails.img4 ?? '',
                      ],
                    ),
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
                            children: [
                              Expanded(
                                  child: Text(
                                productDetails.product?.title ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.black),
                              )),
                              const SizedBox(
                                width: 50,
                              ),
                              const ProductStepper()
                            ],
                          ),
                          SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.star_fill,
                                      size: 18,
                                      fill: 1.0,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      "${productDetails.product?.star}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black38),
                                    )
                                  ],
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Get.to(() => ProductReviewScreen(
                                        productId: widget.productId));
                                  },
                                  child: Text(
                                    "Reviews",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: primaryColor,
                                        fontSize: 16),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final bool response =
                                        await SaveLoggedUserData.isUserLogged();

                                    if (response) {
                                      await productDetailScreenController
                                          .createWishList(
                                              productId:
                                                  productDetails.id.toString())
                                          .then((value) => Get.snackbar(
                                              "Successfully",
                                              "Create wishlist successfully"));
                                      log(response.toString());
                                    } else {
                                      Get.to(() => LoginScreen());
                                    }
                                  },
                                  child: Card(
                                    color: primaryColor,
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Color",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: colors
                                    .map((color) => InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            if (_selectedColor != color) {
                                              _selectedColor = color;
                                              if (mounted) {
                                                setState(() {});
                                              }
                                            }
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: color,
                                                shape: BoxShape.circle),
                                            child: Visibility(
                                              visible: _selectedColor == color,
                                              child: const Icon(
                                                color: Colors.white,
                                                size: 30,
                                                CupertinoIcons.checkmark_alt,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Size",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: sizes
                                    .map((size) => InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            if (_selectedProductSize != size) {
                                              _selectedProductSize = size;
                                              if (mounted) {
                                                setState(() {});
                                              }
                                            }
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            height: 30,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color:
                                                    _selectedProductSize == size
                                                        ? primaryColor
                                                        : null,
                                                shape: BoxShape.rectangle,
                                                border: Border.all(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                                child: Text(
                                              size,
                                              style:
                                                  _selectedProductSize == size
                                                      ? const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.white)
                                                      : null,
                                            )),
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ProductDescription(
                            productDescription: productDetails.des ?? '',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomSheetForShowPriceAndBuyButton(
              productPrice: productDetails.product?.price ?? '',
              productId: widget.productId,
              productColor: getSelectedProductHexColor(_selectedColor!),
              productSize: _selectedProductSize,
            )
          ],
        );
      }),
    );
  }

  List<Color> getProductColor({required String color}) {
    List<Color> hexColor = [];
    List<String> colors = color.split(',');
    for (var e in colors) {
      hexColor.add(Color(int.parse(e.replaceAll('#', '0xff'))));
    }
    return hexColor;
  }

  getSelectedProductHexColor(Color selectedProductColor) {
    return selectedProductColor
        .toString()
        .replaceAll('0xff', '#')
        .replaceAll('Color(', '')
        .replaceAll(')', '');
  }

  List<String> getProductSize({required String sizes}) => sizes.split(',');
}
