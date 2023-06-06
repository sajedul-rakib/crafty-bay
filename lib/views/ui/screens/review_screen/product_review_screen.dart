import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/create_review_screen/create_review_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/review_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../widgets/product/review/product_review_cart.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    Get.find<ProductReviewController>()
        .getProductReviewData(productId: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          appBarTitle: "Review",
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Get.find<ProductReviewController>()
                .getProductReviewData(productId: widget.productId);
          },
          child: GetBuilder<ProductReviewController>(
              builder: (productReviewController) {
            return productReviewController.productReviewScreenInProgress
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: primaryColor,
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: productReviewController
                                    .productReviewModel.data?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductReviewCart(
                                  reviewDescription: productReviewController
                                          .productReviewModel
                                          .data?[index]
                                          .description ??
                                      '',
                                  profile: productReviewController
                                      .productReviewModel.data?[index].profile,
                                ),
                              );
                            }),
                      ),
                      BottomSheetForShowTotalReviewCountAndAddReview(
                        totalReview: productReviewController
                            .productReviewModel.data!.length
                            .toString(),
                      )
                    ],
                  );
          }),
        ));
  }
}

class BottomSheetForShowTotalReviewCountAndAddReview extends StatelessWidget {
  const BottomSheetForShowTotalReviewCountAndAddReview(
      {super.key, required this.totalReview});

  final String totalReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
          color: primarySoftColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: SaveLoggedUserData.token != null
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          Text(
            "Reviews  ($totalReview)",
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
          ),
          SaveLoggedUserData.token != null
              ? FloatingActionButton(
                  onPressed: () {
                    Get.to(() =>  CreateReviewScreen());
                  },
                  backgroundColor: primaryColor,
                  highlightElevation: 0,
                  elevation: 0,
                  child: const Icon(CupertinoIcons.plus),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
