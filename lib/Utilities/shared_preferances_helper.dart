

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_model.dart';

class SharedPref{
  // singleton
  factory SharedPref(){
    _this ??= SharedPref._();
    return _this!;
  }
  static SharedPref? _this;
  SharedPref._();


  static SharedPreferences? prefs;

  static const String _userObj = "userObj";
  static const String _language = "language_code";

  init()async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveUserObj({required UserModel user})async{
    return await prefs?.setString(_userObj, jsonEncode(user.toJson()));
  }
  static UserModel? getUserObg(){
    String? userStringData = prefs?.getString(_userObj);
    if(userStringData==null) return null;
    return UserModel.fromJson(jsonDecode(userStringData));
  }


  static bool isUserLogIn(){
    return prefs?.getString(_userObj)!=null;
  }

  static Future<void> logOut()async{
    await prefs?.remove(_userObj);
  }

  static String? getLanguage(){
    return prefs?.getString(_language);
  }
  static Future<void> setLanguage({required String lang})async{
    await prefs?.setString(_language,lang);
  }
}