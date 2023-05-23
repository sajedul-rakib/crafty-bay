
import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class BottomSheetForShowPriceAndBuyButton extends StatelessWidget {
  const BottomSheetForShowPriceAndBuyButton({
    super.key,
    required int productPrice,
    required int itemCount,
  }) : _productPrice = productPrice, _itemCount = itemCount;

  final int _productPrice;
  final int _itemCount;

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
                "\$${(_productPrice * _itemCount).toString()}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: primaryColor),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                elevation: 0),
            child: const Text(
              "Add To Cart",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
