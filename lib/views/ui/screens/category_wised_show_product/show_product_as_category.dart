import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/product/product_cart.dart';
import 'package:flutter/material.dart';

class ShowProductAsCategoryName extends StatelessWidget {
  const ShowProductAsCategoryName({Key? key, required this.categoryName})
      : super(key: key);

  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: categoryName),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                childAspectRatio: .75),
                itemCount: 500,
                itemBuilder: (context, index) {
                  return const ProductCart();
                }),
          )
        ],
      ),
    );
  }
}
