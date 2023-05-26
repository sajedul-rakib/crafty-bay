import 'package:get/get.dart';
import 'controller.dart';

class UserProfileData implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}
