import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/data/models/wishlist/wishlist_data_model.dart';
import 'package:get/get.dart';

import '../../../../data/models/response_models/response_model.dart';

class WishListController extends GetxController {
  bool _wishListScreenInProgress = false;

  WishListModel _wishListModel = WishListModel();

  bool get wishListScreenInProgress => _wishListScreenInProgress;

  WishListModel get wishListProductModel => _wishListModel;

  Future<bool> getWishListProduct() async {
    _wishListScreenInProgress = true;
    update();
    ResponseModel response =
        await NetworkUtils.getRequest(Urls.productWishList);
    _wishListScreenInProgress = false;
    if (response.isSuccess) {
      log("from wishlist controller:${response.responseData}");
      _wishListModel = WishListModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    log('call from wishlist');
    getWishListProduct();
  }

}
