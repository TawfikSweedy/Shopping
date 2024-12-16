
import 'dart:developer';
import 'package:shopping/Utilities/helper.dart';
import '../Models/login_model.dart';
import '../Models/user_model.dart';
import '../Utilities/shared_preferances_helper.dart';
import 'api_helper.dart';

class AuthApi {
  static Future<LoginModel?> login(
      {required String userName, required String password}) async {
    // String? fcm = await FirebaseMessaging.instance.getToken();
    var response = await APIHelper.postRequest(
      url: APIHelper.login,
      body: {"username": userName, "password": password},
    );
    if (response == null) return null;
    log(response.toString());
    if (response["status"] == true) {
      if (response["data"]["first_login_token"] == null) SharedPref.saveUserObj(
          user: UserModel.fromJson(response['data']['model'])
            ..token = response['data']['token']
            ..jobType = response['data']['job_type']);
      // Helper.handleError(response["data"]['otp'].toString());

      return LoginModel.fromJson(response["data"]);
    } else {
      Helper.handleError("wrong_email_password".tr);
      // Helper.handleError(response["message"]);
      return null;
    }
  }
}