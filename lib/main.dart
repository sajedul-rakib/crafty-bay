import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/cart_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/otp_verification_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/product_detail_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/review_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/signin_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/splash_screen/splash_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/wishlist_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



void main(){
  runApp(const CraftyBay());
}


class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GetxBindings(),
      home:   const SplashScreen(),
      theme: ThemeData(
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black38,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          selectedIconTheme: IconThemeData(
            size: 30,
            color: primaryColor
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black38,
            size: 30
          )
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        fontFamily:GoogleFonts.lato().fontFamily
      ),
    );
  }
}


class GetxBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
    Get.put(LogInScreenController());
    Get.put(OtpVerificationController());
    Get.put(HomeScreenController());
    Get.put(CompleteProfileController());
    Get.put(ProductDetailScreenController());
    Get.put(WishListController());
    Get.put(ProductReviewController());
    Get.put(CartScreenController());
  }
}

