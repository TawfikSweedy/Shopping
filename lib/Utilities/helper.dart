import 'package:shopping/Utilities/toast_helper.dart';

import '../Locale/locales.dart';


// ignore: camel_case_extensions
extension translate on String {
  String get tr => AppLocalizations.instance.translate(this) ?? "";
}

class Helper {
  static handleError(var result) {
    if (result.runtimeType == String) {
      ToastHelper.showError(message: result ?? "");
    } else if (result.runtimeType == List) {
      ToastHelper.showError(
          message: result.join('!@#').replaceAll('!@#', "'\n"));
    } else {
      ToastHelper.showError(message: result ?? "");
    }
  }
}

