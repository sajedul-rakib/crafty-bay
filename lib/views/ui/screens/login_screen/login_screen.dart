import 'dart:developer';

import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:get/get.dart';
import 'package:crafty_bay_ecommerce/widgets/common/screen_title_&_subtitle.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/common/app_elevated_button.dart';
import '../../../../widgets/common/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        GetBuilder<LogInScreenController>(builder: (logInScreenController) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
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
                height: 20,
              ),
              const ScreenTitleSubtitle(
                title: "Welcome Back",
                subTitle: 'Please Enter Your Email Address',
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  InputFormField(
                    hintText: 'Email Address',
                    textEditingController: _emailETController,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please Enter Your Email!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: logInScreenController.logInScreenInProgress
                        ? const CircularProgressIndicator()
                        : AppElevatedButton(
                            text: 'Next',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final bool response =
                                    await logInScreenController.logIn(
                                        email: _emailETController.text.trim());
                                if (response) {
                                  Get.to(OtpVerificationScreen(
                                    email: _emailETController.text.trim(),
                                  ));
                                } else {
                                  if (context.mounted) {
                                    log(context.mounted.toString());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Email verification failed. Try again',
                                        ),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                          ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }));
  }
}
