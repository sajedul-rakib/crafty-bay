import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/data/models/response_models/response_model.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  bool _cartScreenInProgress = false;
  bool _addCartInProgress = false;

  bool get cartScreenController => _cartScreenInProgress;

  bool get addCartInProgress => _addCartInProgress;

  Future<bool> addCart({required Map<String, dynamic> cartDetails}) async {
    _addCartInProgress = true;
    update();
    ResponseModel response =
        await NetworkUtils.postRequest(Urls.createCart, cartDetails);
    _addCartInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
