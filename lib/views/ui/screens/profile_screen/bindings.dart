import 'package:crafty_bay_ecommerce/views/ui/screens/profile_screen/controller.dart';
import 'package:get/get.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ProfileScreenController());
  }
}
