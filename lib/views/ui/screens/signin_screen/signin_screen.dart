import 'package:crafty_bay_ecommerce/views/ui/screens/signin_screen/controller.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:get/get.dart';

import 'package:crafty_bay_ecommerce/widgets/common/app_elevated_button.dart';
import 'package:crafty_bay_ecommerce/widgets/common/screen_title_&_subtitle.dart';
import 'package:crafty_bay_ecommerce/widgets/common/text_form_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends GetView<CompleteProfileController> {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileNameETController = TextEditingController();
  final TextEditingController _cityNameETController = TextEditingController();
  final TextEditingController _shippingNameETController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map<String, String> userProfileData = {
      "firstName": _firstNameETController.text.trim(),
      "lastName": _lastNameETController.text.trim(),
      "mobile": _mobileNameETController.text.trim(),
      "city": _cityNameETController.text.trim(),
      "shippingAddress": _shippingNameETController.text.trim()
    };
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  InputFormField(
                    keyBoardType: TextInputType.name,
                    hintText: 'First Name',
                    textEditingController: _firstNameETController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your first name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFormField(
                    keyBoardType: TextInputType.name,
                    hintText: 'Last Name',
                    textEditingController: _lastNameETController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your last name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFormField(
                    keyBoardType: TextInputType.phone,
                    hintText: 'Mobile',
                    textEditingController: _mobileNameETController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your mobile number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFormField(
                    keyBoardType: TextInputType.text,
                    hintText: 'City',
                    textEditingController: _cityNameETController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your city";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputFormField(
                    keyBoardType: TextInputType.multiline,
                    hintText: 'Shipping Address',
                    maxLine: 4,
                    textEditingController: _shippingNameETController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your shipping address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: AppElevatedButton(
                        text: 'Complete',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? true) {
                            final response = await controller
                                .createProfileData(userProfileData);
                            if (response) {
                              Get.to(() => BottomNavigation());
                            }
                          }
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
