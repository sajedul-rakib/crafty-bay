import 'package:crafty_bay_ecommerce/views/ui/screens/create_review_screen/create_review_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../utils/colors/app_colors.dart';
import '../../../../widgets/product/review/product_review_cart.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(appBarTitle: "Review",),
        bottomSheet: Container(
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
              const Text("Reviews  (1000)",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black
              ),),
              FloatingActionButton(
                onPressed: () {
                  Get.to(()=>const CreateReviewScreen());
                },
                backgroundColor: primaryColor,
                highlightElevation: 0,
                elevation: 0,
                child: const Icon(CupertinoIcons.plus),
              )
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductReviewCart(),
              );
            }));
  }
}
