import 'package:get/get.dart';

import '../../../../apis/networks/network_caller.dart';
import '../../../../apis/urls/urls.dart';

class LogInScreenController extends GetxController {
  bool _logInScreenInProgress = false;

  bool get logInScreenInProgress => _logInScreenInProgress;

  Future<bool> logIn({required String email}) async {
    _logInScreenInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(Urls.logInUsers(email));

    _logInScreenInProgress = false;

    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

