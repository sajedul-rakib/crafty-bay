
import 'package:crafty_bay_ecommerce/views/ui/screens/profile_screen/profile_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/signin_screen/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_bar_icon.dart';

AppBar appBar(){
  return  AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      children: [
        Image.asset('assets/images/logo_nav.png'),
        const Spacer(),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppBarIcon(iconData: CupertinoIcons.person,onPressed: (){
            Get.to(()=>const ProfileScreen());
          },),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: AppBarIcon(iconData: CupertinoIcons.phone,),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: AppBarIcon(iconData: CupertinoIcons.bell,),
        )
      ],
    ),
  );
}
