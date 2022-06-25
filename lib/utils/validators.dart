import 'package:flutter/material.dart';
import 'package:ren/constants/constants.dart';

String? Function(String?)? emailOrPhoneNumberValidator(
    GlobalKey<FormState> formKey) {
  return (value) {
    if (value == null || value.isEmpty) {
      return "Email or Phone number is required";
    } else if (phoneRegex.hasMatch(value) || emailRegex.hasMatch(value)) {
      formKey.currentState!.save();
      return null;
    } else {
      return "Email or Phone number is invalid";
    }
  };
}

String? Function(String?)? passwordValidator(GlobalKey<FormState> formKey) {
  return (value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password should be atlease 6 characters";
    }
    formKey.currentState!.save();
    return null;
  };
}
