import 'dart:developer';

import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/home_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bottom_navigation/bottom_navigation_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      checkUserAreLogged();
    });
    super.initState();
  }

  Future<void> checkUserAreLogged()async {
    bool isUserLogged=await SaveLoggedUserData.isUserLogged();
    if(isUserLogged){
      Get.offAll(()=> BottomNavigation());
    }else{
      Get.offAll(()=>LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/images/logo.png',width: 100,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children:  [
                CircularProgressIndicator(
                  strokeWidth: 4,
                  color: primaryColor,
                ),
                const SizedBox(height: 10,),
                const Text("Version 1.0",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
