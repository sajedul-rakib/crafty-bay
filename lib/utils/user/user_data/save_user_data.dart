
import 'package:shared_preferences/shared_preferences.dart';

class SaveLoggedUserData {
  static String? token,
      firstName,
      lastName,
      userEmail,
      userPhoneNumber,
      userShippingAddress;

  //save the logged user profile data
  // static Future<void> saveLoggedUserProfileData(
  //     {required String loggedUserFirstName,
  //     required String loggedUserLastName,
  //     required String loggedUserEmail,
  //     required String loggedUserPhoneNumber,
  //     required String loggedUserShippingAddress}) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString('firstName', loggedUserFirstName);
  //   sharedPreferences.setString('lastName', loggedUserLastName);
  //   sharedPreferences.setString('email', loggedUserEmail);
  //   sharedPreferences.setString('mobile', loggedUserPhoneNumber);
  //   sharedPreferences.setString('shippingAddress', loggedUserShippingAddress);
  //
  //   firstName =await getUserDataByParams('firstName');
  //   lastName = await getUserDataByParams('lastName');
  //   userEmail = await getUserDataByParams('email');
  //   userPhoneNumber = await getUserDataByParams('mobile');
  //   userShippingAddress = await getUserDataByParams('shippingAddress');
  //   token=await getUserDataByParams('token');
  // }

  //get user data

  static Future<String> getUserDataByParams(whichParams) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(whichParams).toString();
  }

  //save the logged user token
  static Future<void> saveLoggedUserToken({required String token}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    token = token;
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
