import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/data/models/product/product_review_model.dart';
import 'package:crafty_bay_ecommerce/data/models/response_models/response_model.dart';
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  bool _productReviewScreenInProgress = false;
  ProductReviewModel _productReviewModel = ProductReviewModel();

  bool get productReviewScreenInProgress => _productReviewScreenInProgress;

  ProductReviewModel get productReviewModel => _productReviewModel;

  Future<bool> getProductReviewData({required productId}) async {
    _productReviewScreenInProgress=true;
    update();
    ResponseModel response =
        await NetworkUtils.getRequest(Urls.productReview(productId: productId));
    _productReviewScreenInProgress=false;
    if(response.isSuccess){
      _productReviewModel=ProductReviewModel.fromJson(response.responseData);
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}
