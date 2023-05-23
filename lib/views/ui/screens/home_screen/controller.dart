
import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/carousel_slider_data_model/carousel_slider_model.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/product_category_data/cart_category_data_model.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/product_category_data/list_product_by_remark_data_model.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController {
  bool _homeScreenInProgress = false;
  bool _carouselInProgress = false;
  bool _listProductByRemarkType=false;
  CartCategoryDataModel _cartCategoryDataModel =
      CartCategoryDataModel();
  CarouselSliderDataModel _carouselSliderDataModel=CarouselSliderDataModel();
  ListProductByRemarkDataModel _listProductByRemarkDataModel=ListProductByRemarkDataModel();


  bool get carouselInProgress => _carouselInProgress;
  bool get homeScreenInProgress => _homeScreenInProgress;
  bool get listProductByRemarkTypeInProgress=>_listProductByRemarkType;

  get cartCategoryDataModel => _cartCategoryDataModel;
  get carouselSliderDataModel=>_carouselSliderDataModel;
  get listProductByRemarkDataModel=>_listProductByRemarkDataModel;

//for get cart category details from api
  Future<bool> getCategoryCartDetails() async {
    _homeScreenInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(Urls.categoryList);

    _homeScreenInProgress = false;
    if (response.isSuccess) {
      _cartCategoryDataModel =
          CartCategoryDataModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


//for get carousel slider data from api
  Future<bool> getCarouselSliderDetails() async {
    _carouselInProgress = true;
    update();
    final result = await NetworkUtils.getRequest(Urls.listProductSlider);
    _carouselInProgress = false;

    if (result.isSuccess) {
      _carouselSliderDataModel = CarouselSliderDataModel.fromJson(result.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


//for get listProductByRemarkType product data from api
  Future<bool> listProductByRemark({required String remarkType})async{
    _listProductByRemarkType=true;
    update();
    final response=await NetworkUtils.getRequest(Urls.listProductByRemarkType(remarkType: remarkType));

    _listProductByRemarkType=false;
    if(response.isSuccess){
      _listProductByRemarkDataModel=ListProductByRemarkDataModel.fromJson(response.responseData);
      update();
      return true;
    }else{
      update();
      return false;
    }
  }


  @override
  void onReady() {
    getCategoryCartDetails();
    getCarouselSliderDetails();
    listProductByRemark(remarkType: 'special');
    super.onReady();
  }


}
