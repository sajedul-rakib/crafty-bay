import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:get/get.dart';

import '../../../../utils/user/user_data/save_user_data.dart';
import '../signin_screen/signin_screen.dart';

class ProfileScreenController extends GetxController {
  bool _profileScreenInProgress = false;

  bool get profileScreenController => _profileScreenInProgress;

  Future<bool> getUserProfileData({token}) async {
    _profileScreenInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(
      Urls.readProfiles,
      token: token
    );
    _profileScreenInProgress = false;
    if (response.isSuccess) {
      if (response.responseData['msg'] == 'success' &&
          response.responseData['data'].isEmpty) {
        Get.to(() => SignInScreen());
        update();
        return false;
      } else {
        log(response.responseData['data'].toString());
        SaveLoggedUserData.saveLoggedUserProfileData(response.responseData);
        update();
        return true;
      }
    } else {
      update();
      return false;
    }
  }
}
