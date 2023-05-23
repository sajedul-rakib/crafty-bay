import 'dart:developer';

import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/login_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/profile_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/profile_screen/profile_detail_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          appBarTitle: 'Profile Settings',

          isAttachBackground: false,
          elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GetBuilder<ProfileScreenController>(
              builder:(profileScreenController){return ListTile(
                title: const Text('My profile'),
                leading: const Icon(
                  CupertinoIcons.person,
                ),
                trailing: const Icon(CupertinoIcons.right_chevron),
                style: ListTileStyle.list,
                tileColor: primarySoftColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onTap: ()async {
                  bool response=await profileScreenController.readUserData();

                  if(response){
                    Get.to(() => const ProfileDetailScreen());
                  }else {
                    log('Something happened wrong');
                  }
                },
              );}
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              title: const Text('Address Book'),
              leading: const Icon(CupertinoIcons.car),
              trailing: const Icon(CupertinoIcons.right_chevron),
              style: ListTileStyle.list,
              tileColor: primarySoftColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(CupertinoIcons.person_alt_circle),
              trailing: const Icon(Icons.logout),
              style: ListTileStyle.list,
              tileColor: Colors.red.withOpacity(0.25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onTap: () {
                Future.delayed(const Duration(seconds: 1)).then((value) async {
                  await SaveLoggedUserData.userLoggedOut();
                  Get.to(() => LoginScreen());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
