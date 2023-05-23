import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/common/category_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends GetView<HomeScreenController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: 'Categories'),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: controller.cartCategoryDataModel.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return CategoryCart(
                    categoryDetails:
                        controller.cartCategoryDataModel.data[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
