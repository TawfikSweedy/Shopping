import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Modules/Main_Pages/main_screen.dart';
import '../../../Api/auth_api.dart';
import '../../../Models/login_model.dart';

class LoginController extends ControllerMVC {
  /// singleton
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  static LoginController? _this;

  LoginController._();

  bool loading = false,
      autoValidate = false,
      showPassword = true;

  LoginModel? model;
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    emailController = TextEditingController(
        text: kDebugMode ? "elsayedmahmoud409@gmail.com" : '');
    passwordController =
        TextEditingController(text: kDebugMode ? "Abdo123@" : '');
    super.initState();
  }

  Future logIn(BuildContext context) async {
    setState(() => loading = true);
    model = await AuthApi.login(
        userName: emailController.text, password: passwordController.text);

    setState(() => loading = false);
    if (model != null) {
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName, arguments: 0);
        // Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
    }
  }
}