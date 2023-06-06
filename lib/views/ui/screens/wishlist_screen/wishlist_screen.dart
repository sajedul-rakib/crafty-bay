
import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/wishlist_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/product/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: 'Wish List',
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Get.find<WishListController>().getWishListProduct();
        },
        child: GetBuilder<WishListController>(builder: (wishListController) {
          if (wishListController.wishListScreenInProgress) {
            return Center(
                child: CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 5,
            ));
          } else {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: wishListController
                              .wishListProductModel.data?.length ??
                          0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: .8),
                      itemBuilder: (context, index) {
                        return ProductCart(
                          product: wishListController
                              .wishListProductModel.data![index].product,
                        );
                      }),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
