import 'package:get/get.dart';

import '../../../../apis/networks/network_caller.dart';
import '../../../../apis/urls/urls.dart';
import '../../../../data/models/response_models/response_model.dart';

class LogInScreenController extends GetxController {
  bool _logInScreenInProgress = false;

  bool get logInScreenInProgress => _logInScreenInProgress;

  Future<bool> logIn({required String email}) async {
    _logInScreenInProgress = true;
    update();
    ResponseModel response = await NetworkUtils.getRequest(Urls.logInUsers(email));

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

