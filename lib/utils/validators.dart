import 'package:flutter/material.dart';
import 'package:ren/constants/constants.dart';

String? Function(String?)? emailValidator(GlobalKey<FormState> formKey) {
  return (value) {
    if (value != null && value.isNotEmpty && !emailRegex.hasMatch(value)) {
      return "Invalid email";
    }
    formKey.currentState!.save();
    return null;
  };
}

String? Function(String?)? phoneNumberValidator(GlobalKey<FormState> formKey) {
  return (value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!phoneRegex.hasMatch(value)) {
      return "Invalid phone number";
    }
    formKey.currentState!.save();
    return null;
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

String? Function(String?)? confirmPasswordValidator(
    GlobalKey<FormState> formKey, String password) {
  return (value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password should be atlease 6 characters";
    } else if (value != password) {
      return "Password and confirm password mismatch";
    }
    formKey.currentState!.save();
    return null;
  };
}

String? Function(String?)? requiredValidator(
    GlobalKey<FormState> formKey, String msg) {
  return (value) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    formKey.currentState!.save();
    return null;
  };
}
