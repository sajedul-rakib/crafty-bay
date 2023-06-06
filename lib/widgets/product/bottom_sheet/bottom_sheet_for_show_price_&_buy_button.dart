import 'package:crafty_bay_ecommerce/views/ui/screens/cart_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors/app_colors.dart';

class BottomSheetForShowPriceAndBuyButton extends StatelessWidget {
  const BottomSheetForShowPriceAndBuyButton({
    super.key,
    required this.productPrice,
    required this.productId,
    required this.productColor,
    required this.productSize,
  });

  final String productPrice;
  final String productId;
  final String? productColor;
  final String? productSize;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.black38),
              ),
              Text(
                "\$${productPrice.toString()}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: primaryColor),
              )
            ],
          ),
          GetBuilder<CartScreenController>(builder: (cartScreenController) {
            return cartScreenController.addCartInProgress
                ? CircularProgressIndicator(
                    strokeWidth: 5,
                    color: primaryColor,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      await cartScreenController.addCart(cartDetails: {
                        'productId': productId,
                        "color": productColor,
                        "size": productSize
                      }).then((value) =>
                          Get.snackbar("Cart add successfully", 'Cart added'));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        elevation: 0),
                    child: const Text(
                      "Add To Cart",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
