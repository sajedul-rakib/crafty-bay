import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay_ecommerce/data/models/response_models/response_model.dart';
import 'package:crafty_bay_ecommerce/utils/user/user_data/save_user_data.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  NetworkUtils._();

  static Future<dynamic> getRequest(String url) async {
    final String userToken=await SaveLoggedUserData.getUserDataByParams('token');
    log(userToken.toString());
    final http.Response response = await http.get(Uri.parse(url),headers: {
      'content-type':'application/json',
      'token':userToken.toString()
    });

    try {
      if (response.statusCode == 200) {
        return ResponseModel(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: jsonDecode(response.body));
      } else {
        ResponseModel(
            statusCode: response.statusCode,
            isSuccess: false,
            responseData: jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          statusCode: -1, isSuccess: false, responseData: e.toString());
    }
  }
}
