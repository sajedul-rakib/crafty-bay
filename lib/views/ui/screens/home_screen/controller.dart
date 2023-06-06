import 'package:crafty_bay_ecommerce/apis/networks/network_caller.dart';
import 'package:crafty_bay_ecommerce/apis/urls/urls.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/carousel_slider_data_model/carousel_slider_model.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/category_list_model.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/product_category_data/list_product_by_remark_data_model.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/wishlist_screen/controller.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  bool _homeScreenInProgress = false;
  bool _carouselInProgress = false;
  bool _getProductByRemarkSpecialInProgress = false;
  bool _getProductByRemarkPopularInProgress = false;
  bool _getProductByRemarkNewInProgress = false;
  CategoryListModel _categoryListModel = CategoryListModel();
  CarouselSliderDataModel _carouselSliderDataModel = CarouselSliderDataModel();
  ListProductByRemark _listProductByRemarkSpecial = ListProductByRemark();
  ListProductByRemark _listProductByRemarkPopular = ListProductByRemark();
  ListProductByRemark _listProductByRemarkNew = ListProductByRemark();

  bool get carouselInProgress => _carouselInProgress;

  bool get homeScreenInProgress => _homeScreenInProgress;
  bool get getProductByRemarkSpecialInProgress => _getProductByRemarkSpecialInProgress;
  bool get getProductByRemarkPopularInProgress => _getProductByRemarkPopularInProgress;
  bool get getProductByRemarkNewInProgress => _getProductByRemarkNewInProgress;


  CategoryListModel get categoryListModel => _categoryListModel;

 CarouselSliderDataModel get carouselSliderDataModel => _carouselSliderDataModel;

  ListProductByRemark get listProductBySpecialRemark => _listProductByRemarkSpecial;
  ListProductByRemark get listProductByPopularRemark => _listProductByRemarkPopular;
  ListProductByRemark get listProductByNewRemark => _listProductByRemarkNew;

//for get cart category details from api
  Future<bool> getCategoryCartDetails() async {
    _homeScreenInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(Urls.categoryList);

    _homeScreenInProgress = false;
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
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
      _carouselSliderDataModel =
          CarouselSliderDataModel.fromJson(result.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

//for get listProductByRemarkType product data from api
  Future<bool> listProductByRemarkSpecial() async {
    _getProductByRemarkSpecialInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(
        Urls.listProductByRemarkType(remarkType: 'special'));

    _getProductByRemarkSpecialInProgress = false;
    if (response.isSuccess) {
      _listProductByRemarkSpecial =
          ListProductByRemark.fromJson(response.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  Future<bool> listProductByRemarkPopular() async {
    _getProductByRemarkPopularInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(
        Urls.listProductByRemarkType(remarkType: 'popular'));

    _getProductByRemarkPopularInProgress = false;
    if (response.isSuccess) {
      _listProductByRemarkPopular =
          ListProductByRemark.fromJson(response.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  Future<bool> listProductByRemarkNew() async {
    _getProductByRemarkNewInProgress = true;
    update();
    final response = await NetworkUtils.getRequest(
        Urls.listProductByRemarkType(remarkType: 'new'));

    _getProductByRemarkNewInProgress = false;
    if (response.isSuccess) {
      _listProductByRemarkNew =
          ListProductByRemark.fromJson(response.responseData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  @override
  void onReady() {
    getCarouselSliderDetails();
    getCategoryCartDetails();
    listProductByRemarkPopular();
    listProductByRemarkSpecial();
    listProductByRemarkNew();
    Get.find<WishListController>().getWishListProduct();


    super.onReady();
  }
}
