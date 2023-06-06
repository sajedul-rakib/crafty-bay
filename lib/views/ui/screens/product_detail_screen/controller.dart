import 'dart:developer';

import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/data/models/product/product_detail_model.dart';
import 'package:get/get.dart';

class ProductDetailScreenController extends GetxController {
  bool _productDetailScreenInProgress=false;
  bool _createWishListInProgress=false;

  ProductDetailModel _productDetailModel=ProductDetailModel();

  bool get productDetailScreenInProgress=>_productDetailScreenInProgress;
  bool get createWishListInProgress=>_createWishListInProgress;

  ProductDetailModel get productDetailModel=>_productDetailModel;


  Future<bool>getProductDetails({required productId}) async {
    _productDetailScreenInProgress=true;
    update();
    final response=await NetworkUtils.getRequest(Urls.productDetails(productId: productId));

    _productDetailScreenInProgress=false;
    if(response.isSuccess){
      _productDetailModel=ProductDetailModel.fromJson(response.responseData);
      update();
      return true;
    }else{
      update();
      return false;
    }

  }

  Future<bool> createWishList({required String productId})async{
    _createWishListInProgress=true;
    update();
    final response=await NetworkUtils.getRequest(Urls.createWishList(productId: productId));

    _createWishListInProgress=false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      update();
      return false;
    }
  }

}
