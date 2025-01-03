import 'package:flutter/material.dart';
import 'package:shopping/Utilities/helper.dart';
import 'package:shopping/Utilities/toast_helper.dart';

class Validator {
  static validateEmpty(String value, String textField) {
    if (value.trim().isEmpty) {
      return "$textField ${"field_is_required".tr}";
    }
    return null;
  }
  static validateOTP(String? otp) {
    if(otp!.length>2){
      return null;
    } else{
      return "incorrect_code".tr;
    }
  }
  static validateSpecialCharacter(BuildContext context ,String name, String textField) {
    var nameReg = RegExp(r'^[^\d]*$');

    if (Validator.validateEmpty(name, textField) == null) {
      if (!nameReg.hasMatch(name)) {
        ToastHelper.showError(message: "name_error".tr);
        return "";
      }
    } else {
      return Validator.validateEmpty(name, textField);
    }
  }

  static validateEmail(String? email) {
    var emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email!.trim().isEmpty) {
      return "email_field_is_required".tr;
    } else if (!emailRegExp.hasMatch(email)) {
      return "email_field_is_wrong".tr;
    }
    return null;
  }

  static validateName(String? name) {
    var nameReg = RegExp(r'^[^\d]*$');
    if (name!.trim().isEmpty) {
      return "field_is_required".tr;
    } else if (!nameReg.hasMatch(name)) {
      return "name_error".tr;
    }
    return null;
  }

  static validatePassword(String? password,{String? msg}) {
    var passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password!.trim().isEmpty) {
      return msg??"password_field_is_required".tr;
    } else if(password.length < 8) {
      return "password_error".tr;
    }
    else if (!passwordRegExp.hasMatch(password)) {
      return "password_error".tr;
    }
    return null;
  }

  static matchPasswords(String? password, String? passwordConfirmation) {
    if (passwordConfirmation!.isEmpty) {
      return "password_confirmation_field".tr;
    } else if (password != passwordConfirmation) {
      return "password_not_match".tr;
    }
    return null;
  }
  static RegExp phoneRegExp = RegExp(r'^0|1[0125][0-9]{8}$');

  static validatePhone(String? phone) {
    var phoneRegExp = RegExp(r'^0|1[0125][0-9]{8}$');
    var textIsArabic = RegExp(r'^[\0621-\064A0-9 ]+$');
    if (phone!.trim().isEmpty) {
      return 'phone_field_is_required'.tr;
    }  else if(!textIsArabic.hasMatch(phone)){
      return "number_wrong".tr;
    } else if (!phoneRegExp.hasMatch(phone)) {
      return "phone_error".tr;
    }
    return null;
  }

  static validateNationalId(BuildContext context,String? nationalId) {
    var nationlRegExp = RegExp(r'^([2,3])([0-9]{2})(0[1-9]|1[0-2])(?:0[1-9]|[12][0-9]|3[01])([0-9]{2})[0-9]{3}([0-9])[0-9]$');
    var textIsArabic = RegExp(r'^[\0621-\064A0-9 ]+$');
    if (nationalId!.trim().isEmpty) {
      return "national_id_required".tr;
    } else if(nationalId.length != 14){
      return "national_id_length".tr;
    }  else if(!textIsArabic.hasMatch(nationalId)){
      return "number_wrong".tr;
    } else if (!nationlRegExp.hasMatch(nationalId)) {
      return "national_id_valid".tr;
    }
    return null;
  }

  static validateLength(
      String value, String textField, int minLength, int maxLength) {
    if (validateEmpty(value, textField) != null) {
      return validateEmpty(value, textField);
    } else if (value.length < minLength || value.length > maxLength) {
      return "${"message".tr} ${"less_than".tr} $minLength ${"letters".tr} ${"characters".tr}${"more_than".tr} $maxLength ${"letters".tr} ";
    }
    return null;
  }
}