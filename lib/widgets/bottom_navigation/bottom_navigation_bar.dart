import 'package:crafty_bay_ecommerce/views/ui/screens/cart_screen/cart_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/category_screen/category_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/wishlist_screen/wishlist_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/ui/screens/home_screen/home_screen.dart';

class BottomNavigation extends StatelessWidget {
   BottomNavigation({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(builder: (controller) {
        return SafeArea(child: _screens[controller.selectedIndex]);
      },),
      bottomNavigationBar:
      GetBuilder<BottomNavigationController>(
        builder:(controller) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: (index) {
                controller.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.rectangle_grid_2x2),
                  label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.gift), label: "Wish")
            ],
          );
        }
      ),
    );
  }
}
