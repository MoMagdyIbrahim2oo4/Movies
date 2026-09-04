import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormValidation {

  static String? nameValidation ( String? value ) {
    if ( value == null || value.isEmpty ) {
      return "empty_name_hint".tr() ;
    }
    else {
      return null ;
    }
  }

  static String? emailValidation ( String? value ) {
    final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' );
    if ( value == null || value.isEmpty ) {
      return "empty_email_hint".tr() ;
    }
    else if ( ! emailRegex.hasMatch(value.trim()) ) {
      return "invalid_email_hint".tr() ;
    }
    else {
      return null ;
    }
  }

  static String? passwordValidation ( String? value ) {
    if ( value == null || value.isEmpty ) {
      return "empty_password_hint".tr() ;
    }
    else {
      return null ;
    }
  }

  static String? confirmPasswordValidation ( 
    String? value , 
    TextEditingController passwordController , 
    TextEditingController confirmPasswordController , 
  ) {
      if ( value == null || value.isEmpty ) {
        return "empty_password_hint".tr() ;
      }
      else if ( passwordController.text != confirmPasswordController.text ){
        return "wrong_confirm_password_hint".tr() ;
      }
      else {
        return null ;
      }
  }

  static String? phoneValidation ( String? value ) {
    if ( value == null || value.isEmpty ) {
      return "empty_phone_hint".tr() ;
    }
    else {
      return null ;
    }
  }

}