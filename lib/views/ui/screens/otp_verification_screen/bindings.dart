

import 'package:crafty_bay_ecommerce/views/ui/screens/otp_verification_screen/controller.dart';
import 'package:get/get.dart';

class OtpScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>OtpVerificationController());
  }

}