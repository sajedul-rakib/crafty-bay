import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/signin_screen/signin_screen.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  bool _profileScreenInProgress = false;

  bool get profileScreenController => _profileScreenInProgress;

  Future<bool> getUserProfileData() async {
    _profileScreenInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(Urls.readProfile);
    _profileScreenInProgress = false;
    if (response.isSuccess) {
      if (response.responseData['msg'] == 'success' &&
          response.responseData['data'].isEmpty) {
        Get.to(() => const SignInScreen());
        update();
        return false;
      } else {
        SaveLoggedUserData.saveLoggedUserProfileData(response.responseData);
        update();
        return true;
      }
    } else {}
    update();
    return false;
  }
}
