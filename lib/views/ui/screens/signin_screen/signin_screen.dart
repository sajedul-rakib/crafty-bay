import 'dart:developer';

import 'package:crafty_bay_ecommerce/views/ui/screens/create_review_screen/create_review_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:get/get.dart';

import 'package:crafty_bay_ecommerce/widgets/common/app_elevated_button.dart';
import 'package:crafty_bay_ecommerce/widgets/common/screen_title_&_subtitle.dart';
import 'package:crafty_bay_ecommerce/widgets/common/text_form_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const ScreenTitleSubtitle(
                  title: 'Complete  Profile',
                  subTitle: 'Get start with us with your details',
                ),
                const SizedBox(
                  height: 30,
                ),
                const InputFormField(
                  keyBoardType: TextInputType.name,
                  hintText: 'First Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                const InputFormField(
                  keyBoardType: TextInputType.name,
                  hintText: 'Last Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                const InputFormField(
                  keyBoardType: TextInputType.phone,
                  hintText: 'Mobile',
                ),
                const SizedBox(
                  height: 16,
                ),
                const InputFormField(
                  keyBoardType: TextInputType.text,
                  hintText: 'City',
                ),
                const SizedBox(
                  height: 16,
                ),
                const InputFormField(
                  keyBoardType: TextInputType.multiline,
                  hintText: 'Shipping Address',
                  maxLine: 4,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: 'Complete',
                      onPressed: () {
                        log('Hello');
                        Get.to(() =>  BottomNavigation());
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
