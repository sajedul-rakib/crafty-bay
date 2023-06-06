import 'dart:developer';

import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/login_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/%20app_bar/custom/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(SaveLoggedUserData.getUserDataByParams('firstName').toString());
    return Scaffold(
      appBar: const CustomAppBar(
          appBarTitle: 'Profile Settings',
          isAttachBackground: false,
          elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SaveLoggedUserData.token != null
                ? ListTile(
                    title: const Text('My profile'),
                    leading: const Icon(
                      CupertinoIcons.person,
                    ),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                    style: ListTileStyle.list,
                    tileColor: primarySoftColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onTap: () {},
                  )
                : ListTile(
                    title: const Text('Guest'),
                    leading: const Icon(
                      CupertinoIcons.person,
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ),
                    style: ListTileStyle.list,
                    tileColor: primarySoftColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            SaveLoggedUserData.token != null
                ? ListTile(
                    title: const Text('Log Out'),
                    leading: const Icon(CupertinoIcons.person_alt_circle),
                    trailing: const Icon(Icons.logout),
                    style: ListTileStyle.list,
                    tileColor: Colors.red.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onTap: () {
                      Future.delayed(const Duration(seconds: 1))
                          .then((value) async {
                        await SaveLoggedUserData.userLoggedOut();
                        Get.to(() => LoginScreen());
                      });
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
