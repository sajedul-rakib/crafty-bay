
import 'package:shared_preferences/shared_preferences.dart';

class SaveLoggedUserData {
  static String? loggedUserToken,
      loggedUserFirstName,
      loggedUserLastName,
      loggedUserEmail,
      loggedUserPhoneNumber,
      loggedUserShippingAddress;

  //save the logged user token
  static Future<void> saveLoggedUserToken({required String token}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    loggedUserToken = token;
  }


  //save the logged user profile data
  static Future<void> saveLoggedUserProfileData(
      Map<String, dynamic> loggedUserProfileData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        'firstName', loggedUserProfileData['firstName']);
    sharedPreferences.setString('lastName', loggedUserProfileData['lastName']);
    sharedPreferences.setString('email', loggedUserProfileData['email']);
    sharedPreferences.setString('mobile', loggedUserProfileData['mobile']);
    sharedPreferences.setString(
        'shippingAddress', loggedUserProfileData['shippingAddress']);

    loggedUserFirstName = loggedUserProfileData['firstName'];
    loggedUserLastName = loggedUserProfileData['lastName'];
    loggedUserEmail = loggedUserProfileData['email'];
    loggedUserPhoneNumber = loggedUserProfileData['mobile'];
    loggedUserShippingAddress = loggedUserProfileData['shippingAddress'];
  }

  //get user data

  static Future<String>getUserDataByParams(whichParams)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   return sharedPreferences.getString(whichParams).toString();
  }


  //check is user are logged
  static Future<bool> isUserLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? loggedUserToken = sharedPreferences.getString('token');
    if (loggedUserToken == null) {
      return false;
    } else {
      return true;
    }
  }


  //for log out
  static Future<void> userLoggedOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
