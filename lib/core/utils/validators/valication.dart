import 'package:shipping_clothing_store/core/utils/localization/app_localization.dart';
import 'package:flutter/material.dart';

class CValidator {
  static String? validateEmpty(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.translate('emptyRequired');
    }
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.translate('email_required');
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.translate('invalid_email_address');
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.translate('password_required');
    }

    //Check kí tự password tôi thiểu
    if (value.length < 6) {
      return AppLocalizations.of(context)!.translate('password_minimum');
    }

    // //Check kí tự in hoá
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return AppLocalizations.of(context)!.translate('password_must_contain_uppercase');
    // }

    // //Check kí tự số
    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return AppLocalizations.of(context)!.translate('password_must_contain_number');
    // }

    // //Check kí tự đặc biệt
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return AppLocalizations.of(context)!.translate('password_must_contain_special');
    // }

    return null;
  }

  static String? validatePhoneNumber(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.translate('phone_required');
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.translate('invalid_phone');
    }

    return null;
  }
}
