class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String logInUsers(String userEmail) => '$baseUrl/UserLogin/$userEmail';

  static String verifyUser({required String email, otp}) =>
      '$baseUrl/VerifyLogin/$email/$otp';

  static String createProfile = '$baseUrl/CreateProfile';
  static String readProfiles = '$baseUrl/ReadProfile';
  static String categoryList = '$baseUrl/CategoryList';
  static String listProductSlider = '$baseUrl/ListProductSlider';

  static String listProductByRemarkType({required String remarkType}) =>
      '$baseUrl/ListProductByRemark/$remarkType';
}
