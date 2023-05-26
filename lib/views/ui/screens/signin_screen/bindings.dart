import 'package:get/get.dart';

import 'controller.dart';

class CompleteProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteProfileController());
  }

}