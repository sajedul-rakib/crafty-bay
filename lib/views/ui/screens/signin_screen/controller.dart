import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:get/get.dart';

import '../../../../data/models/response_models/response_model.dart';

class CompleteProfileController extends GetxController {
  bool _completeProfileInProgress = false;

  bool get completeProfileInProgress => _completeProfileInProgress;

  Future<bool> createProfileData({required Map<String,dynamic> body}) async {
    _completeProfileInProgress = true;
    update();
    ResponseModel response =
        await NetworkUtils.postRequest(Urls.createProfile, body);
    _completeProfileInProgress = false;
    if (response.isSuccess) {
      log(response.responseData.toString());
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
