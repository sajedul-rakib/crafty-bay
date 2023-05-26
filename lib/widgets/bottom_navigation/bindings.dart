import 'package:get/get.dart';

import 'controller.dart';

class BottomNavigationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(() => BottomNavigationController());
  }
}
