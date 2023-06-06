import 'dart:async';
import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/models/response_models/response_model.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/login_screen.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/signin_screen/signin_screen.dart';
import 'package:crafty_bay_ecommerce/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:get/get.dart';

import '../../../../apis/urls/urls.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  int _validOtpTimer = 120;

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  int get validOtpTimer => _validOtpTimer;

  set againSetTimer(howManyTime) => _validOtpTimer = howManyTime;

  timer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_validOtpTimer > 0) {
        _validOtpTimer--;
        update();
      } else {
        timer.cancel();
      }
    });
    _validOtpTimer = 120;
    update();
  }

  Future<bool> verifyOtp({required String email, required String otp}) async {
    _otpVerificationInProgress = true;
    update();
    ResponseModel response =
        await NetworkUtils.getRequest(Urls.verifyUser(email: email, otp: otp));
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      await SaveLoggedUserData.saveLoggedUserToken(
              token: response.responseData['data'])
          .then((value) async {
        // await getUserProfileData();
      });
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

//   Future getUserProfileData() async {
//     ResponseModel response = await NetworkUtils.getRequest(Urls.readProfile);
//     log(response.responseData.toString());
//
//     if (response.responseData['msg'] == 'success' &&
//         response.responseData['data'].isEmpty) {
//       Get.offAll(() => SignInScreen());
//     } else if (response.statusCode == 401) {
//       Get.offAll(() => LoginScreen());
//     } else {
//       log(response.responseData['data'].frist['firstName']);
//       // await SaveLoggedUserData.saveLoggedUserProfileData(
//       //     loggedUserFirstName: response.responseData['data'].frist['firstName'],
//       //     loggedUserLastName: response.responseData['data'].frist['lastName'],
//       //     loggedUserEmail: response.responseData['data'].frist['email'],
//       //     loggedUserPhoneNumber: response.responseData['data'].frist['mobile'],
//       //     loggedUserShippingAddress:
//       //         response.responseData['data'].frist['"shippingAddress']);
//       Get.offAll(() => BottomNavigation());
//     }
//   }
 }
