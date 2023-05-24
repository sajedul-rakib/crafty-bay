
import 'package:crafty_bay_ecommerce/views/ui/screens/category_screen/category_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/home/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/category_cart.dart';
import '../../../../widgets/home/search_input_text_form_field.dart';
import '../../../../widgets/product/product_cart.dart';
import '../../../../widgets/home/remarks_title_widgets.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SearchInputTextFormField(),
                const SizedBox(
                  height: 10,
                ),
                HomeCarouselSlider(
                  carouselData: controller.carouselSliderDataModel.data,
                ),
                const SizedBox(
                  height: 20,
                ),
                RemarksTitleWidgets(
                  remarksTitle: 'All Categories',
                  onPressed: () {
                    Get.to(() => const CategoryScreen());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: controller.cartCategoryDataModel.data
                          .map<Widget>((categoryCart) =>
                              CategoryCart(categoryDetails: categoryCart))
                          .toList()),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RemarksTitleWidgets(remarksTitle: "Popular"),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [1, 2, 3, 4, 5]
                          .map<Widget>((e) => const ProductCart())
                          .toList()),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RemarksTitleWidgets(remarksTitle: "Spacial"),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: controller.listProductByRemarkDataModel.data
                          .map<Widget>((singleProduct) =>  ProductCart(productData:singleProduct))
                          .toList()),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RemarksTitleWidgets(remarksTitle: "New"),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 10; i++) const ProductCart()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
