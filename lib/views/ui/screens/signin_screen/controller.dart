import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _completeProfileInProgress = false;

  bool get completeProfileInProgress => _completeProfileInProgress;

  Future<bool> createProfileData(bodyData) async {
    _completeProfileInProgress = true;
    update();
    final response =
        await NetworkUtils.postRequest(Urls.createProfile, bodyData);
    _completeProfileInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
