import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/product/product_stepper/stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarTitle: 'Cart',
      ),
      body: Column(
        children: [
          Card(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: Row(
                  children: [
                    Card(
                      child: Image.network(
                        'https://images.pexels.com/photos/16004744/pexels-photo-16004744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            title: const Text(
                              "Product Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: const Text("Color:Red,Size: XL"),
                            trailing: InkWell(
                              onTap: () {},
                              child: const Icon(
                                CupertinoIcons.delete,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(8.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$100",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const ProductStepper()
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
