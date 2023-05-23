
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/controller.dart';
import 'package:get/get.dart';

class HomeScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CarouselController());
  }


}