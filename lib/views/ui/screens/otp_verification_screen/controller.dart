import 'dart:async';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:get/get.dart';

import '../../../../apis/urls/urls.dart';
import '../profile_screen/controller.dart';

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
    final response =
        await NetworkUtils.getRequest(Urls.verifyUser(email: email, otp: otp));
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      await SaveLoggedUserData.saveLoggedUserToken(
          token: response.responseData['data']);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
