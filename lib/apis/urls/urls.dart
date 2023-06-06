class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String logInUsers(String userEmail) => '$baseUrl/UserLogin/$userEmail';

  static String verifyUser({required String email, otp}) =>
      '$baseUrl/VerifyLogin/$email/$otp';

  static String createProfile = '$baseUrl/CreateProfile';
  static String readProfile = '$baseUrl/ReadProfile';
  static String categoryList = '$baseUrl/CategoryList';
  static String listProductSlider = '$baseUrl/ListProductSlider';

  static String productDetails({required productId}) =>
      '$baseUrl/ProductDetailsById/$productId';

  static String productReview({required productId}) =>
      '$baseUrl/ListReviewByProduct/$productId';

  static String createReview='$baseUrl/CreateProductReview';

  static String listProductByRemarkType({required String remarkType}) =>
      '$baseUrl/ListProductByRemark/$remarkType';

  static String createWishList({required String productId}) =>
      '$baseUrl/CreateWishList/$productId';
  static String productWishList = '$baseUrl/ProductWishList';


  static String createCart='$baseUrl/CreateCartList';
}
