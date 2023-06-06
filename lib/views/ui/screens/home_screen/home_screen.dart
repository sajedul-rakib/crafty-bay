import 'package:crafty_bay_ecommerce/views/ui/screens/category_screen/category_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/category_cart.dart';
import '../../../../widgets/home/carousel_slider.dart';
import '../../../../widgets/home/remarks_title_widgets.dart';
import '../../../../widgets/home/search_input_text_form_field.dart';
import '../../../../widgets/product/product_cart.dart';

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
                GetBuilder<HomeScreenController>(
                    builder: (homeScreenController) {
                  return HomeCarouselSlider(
                    carouselData: homeScreenController
                            .carouselSliderDataModel.carouselData ??
                        [],
                  );
                }),
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
                SizedBox(
                  height: 90,
                  child: GetBuilder<HomeScreenController>(
                      builder: (homeScreenController) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenController
                                .categoryListModel.categories?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return CategoryCart(
                            categoryDetails: homeScreenController
                                    .categoryListModel.categories?[index] ??
                                [],
                          );
                        });
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RemarksTitleWidgets(remarksTitle: "Popular"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 180,
                  child: GetBuilder<HomeScreenController>(
                      builder: (homeScreenController) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenController
                                .listProductByPopularRemark.products?.length ??
                            0,
                        itemBuilder: ((context, index) {
                          return ProductCart(
                              product: homeScreenController
                                  .listProductByPopularRemark.products![index]);
                        }));
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RemarksTitleWidgets(remarksTitle: "Spacial"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 180,
                  child: GetBuilder<HomeScreenController>(
                      builder: (homeScreenController) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenController
                                .listProductBySpecialRemark.products?.length ??
                            0,
                        itemBuilder: ((context, index) {
                          return ProductCart(
                              product: homeScreenController
                                  .listProductBySpecialRemark.products![index]);
                        }));
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RemarksTitleWidgets(remarksTitle: "New"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 180,
                  child: GetBuilder<HomeScreenController>(
                      builder: (homeScreenController) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenController
                                .listProductByNewRemark.products?.length ??
                            0,
                        itemBuilder: ((context, index) {
                          return ProductCart(
                              product: homeScreenController
                                  .listProductByNewRemark.products![index]);
                        }));
                  }),
                ),
                // const SizedBox(
                //   height: 30,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
