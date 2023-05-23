import 'package:crafty_bay_ecommerce/views/ui/screens/login_screen/controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInScreenController());
  }
}
