import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:get/get.dart';

import '../../../../apis/urls/urls.dart';

class ProfileScreenController extends GetxController {
  bool _profileScreenInProgress = false;

  bool get profileScreenInProgress => _profileScreenInProgress;

  Future<bool> readUserData() async {
    _profileScreenInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(Urls.readProfiles);
    _profileScreenInProgress = false;
    if (response.isSuccess) {
      log(response.responseData);
      SaveLoggedUserData.saveLoggedUserProfileData(response.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
