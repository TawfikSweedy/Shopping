import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../Utilities/shared_preferances_helper.dart';



enum Languages {en,ar}

class AppLanguage extends ChangeNotifier {
  Languages _appLanguage = Languages.en;

  Languages get appLang => _appLanguage;

  fetchLocale() async {
    if (SharedPref.getLanguage() == null){
      // final String defaultLocale = Platform.localeName;
      // if(defaultLocale.toLowerCase().contains("en"))
      // {
      //   _appLanguage = Languages.en;
      //   SharedPref.setLanguage(lang: "en");
      //   return null;
      // }else if(defaultLocale.toLowerCase().contains("ar")){
      //   _appLanguage = Languages.ar;
      //   SharedPref.setLanguage(lang: "ar");
      //   return null;
      //
      //   // _appLanguage = Languages.ar;
      //   // SharedPref.setLanguage(lang: "ar");
      //   // return null;
      // }
    }
    // _appLanguage = Languages.values.firstWhere((lang) => lang.name == SharedPref.getLanguage());
    return null;
  }

  Future<void> changeLanguage({Languages? language}) async {
    log(language?.name??"");
    if (_appLanguage == language) return;

    _appLanguage = language!;
    await SharedPref.setLanguage(lang: language.name);
    notifyListeners();
  }
}