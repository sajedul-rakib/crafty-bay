import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/otp_verification_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/profile_screen/controller.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/signin_screen/signin_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:crafty_bay_ecommerce/widgets/common/app_elevated_button.dart';
import 'package:crafty_bay_ecommerce/widgets/common/screen_title_&_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../apis/urls/urls.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key, required this.email})
      : super(key: key);
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.find<OtpVerificationController>().timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OtpVerificationController>(
            builder: (otpVerificationController) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
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
                  title: "Enter OTP Code",
                  subTitle: 'A 4 Digit otp code has been Sent',
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Pinput(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your otp code that send your email";
                      } else {
                        return null;
                      }
                    },
                    controller: _otpETController,
                    onChanged: (value) {
                      log(value.toString());
                    },
                    onCompleted: (value) {},
                    defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: primaryColor),
                            borderRadius: BorderRadius.circular(10))),
                    focusedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "Next",
                      isValid: otpVerificationController.validOtpTimer == 0
                          ? false
                          : true,
                      onPressed: otpVerificationController.validOtpTimer == 0
                          ? null
                          : () async {
                              if (_formKey.currentState?.validate() ?? true) {
                                bool response =
                                    await otpVerificationController.verifyOtp(
                                        email: widget.email.trim(),
                                        otp: _otpETController.text
                                            .trim()
                                            .toString());

                                if (response) {
                                  _otpETController.clear();
                                  otpVerificationController.againSetTimer = 0;
                                  final response =
                                      await Get.find<ProfileScreenController>()
                                          .readUserData();

                                  if (response) {
                                    Get.offAll(BottomNavigation());
                                  } else {
                                    Get.to(() => const SignInScreen());
                                  }
                                } else {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Otp don\'t match!Try again',
                                        ),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                    )),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "The code will expire in ${otpVerificationController.validOtpTimer}s",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black38),
                ),
                TextButton(
                    onPressed: () async {
                      await NetworkUtils.getRequest(
                          Urls.logInUsers(widget.email.trim()));
                      otpVerificationController.timer();
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                          decoration:
                              otpVerificationController.validOtpTimer == 0
                                  ? TextDecoration.underline
                                  : null),
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
