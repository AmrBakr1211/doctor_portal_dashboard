import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';

class InputValidator {
  // static final _emailReg = RegExp(r'[a-z]+\d*@[a-z]+\.[a-z]{3}', caseSensitive: false);
  static final arabicPhoneNumbersReg = RegExp(r"[\u0661-\u0669]");
  static final _arabicTextReg = RegExp(r"[\u0600-\u06ff]+");
  static final _cardNumbersReg = RegExp(r"\d.{4}");
  static final _saudiNumberReg = RegExp(r"((\+|00)?966|0)?5\d{8}$");

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return "Phone Must Be Not Empty";
    } else if (!_saudiNumberReg.hasMatch(value)) {
      return "Invalid Phone Number";
    }
    return null;
  }

  // static String? emailValidator(String value) {
  //   if (value.isEmpty) {
  //     return LocaleKeys.validateRequired.tr(namedArgs: {"name": LocaleKeys.email.tr()});
  //   } else if (_emailReg.hasMatch(value)) {
  //     return null;
  //   } else {
  //     return LocaleKeys.invalidEmail.tr();
  //   }
  // }

  static String? requiredValidator(
      {required String value,
      required String itemName,
      bool lengthRequired = false,
      int lengthNumber = 3}) {
    if (value.trim().isEmpty) {
      return LocaleKeys.validateRequired.tr(namedArgs: {"name": itemName});
    } else if (value.trim().length < lengthNumber && lengthRequired) {
      return LocaleKeys.validateAtLeastDigits
          .tr(namedArgs: {"name": itemName, "number": lengthNumber.toString()});
    }
    return null;
  }

  // static String? codeValidator(String value) {
  //   if (value.isEmpty) {
  //     return LocaleKeys.validateRequired.tr(namedArgs: {"name": LocaleKeys.code.tr()});
  //   } else if (value.length < 4) {
  //     return LocaleKeys.validateAtLeast3Digits.tr(namedArgs: {
  //       "name": LocaleKeys.code.tr(),
  //       "number": "4",
  //     });
  //   }
  //   return null;
  // }

  // static String? passwordValidator(String value, TextEditingController confirmPassword, {lengthRequired = false}) {
  //   if (value.isEmpty) {
  //     return LocaleKeys.passwordRequired.tr();
  //   }
  //   else if (lengthRequired) {
  //     if (value.length >= 6) {
  //       return null;
  //     } else {
  //       return LocaleKeys.validateAtLeast3Digits.tr(namedArgs: {
  //         "name": LocaleKeys.password.tr(),
  //         "number": "6",
  //       });
  //     }
  //   } else if (value != confirmPassword.text) {
  //     return LocaleKeys.passwordsNotMatched.tr();
  //   } else {
  //     return null;
  //   }
  // }
  //
  // static String? confirmPasswordValidator(String password, TextEditingController confirmPassword) {
  //   if (password.isEmpty) {
  //     return LocaleKeys.validateRequired.tr(namedArgs: {"name": LocaleKeys.confirmPassword.tr()});
  //   } else if (confirmPassword.text.isEmpty) {
  //     return null;
  //   } else if (password != confirmPassword.text) {
  //     return LocaleKeys.passwordsNotMatched.tr();
  //   }
  //   return null;
  // }

  static bool isNumbersArabic(String value) {
    if (arabicPhoneNumbersReg.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static String replaceArabicNumbers(String value) {
    return value.replaceAllMapped(
        arabicPhoneNumbersReg, (m) => '${(m[0]!.codeUnits[0] - 1584) - 48}');
  }

  static bool isTextArabic(String value) {
    if (_arabicTextReg.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static String showAsCardNumber(String value) {
    return value.replaceAllMapped(_cardNumbersReg, (m) => '${m[0]} ');
  }

  static String fixPhone({required String phone, required String countryCode}) {
    if (phone.trim().startsWith("0")) {
      phone = phone.trim().substring(1);
    }
    return (countryCode) + replaceArabicNumbers(phone);
  }

  static String fixPhoneCode(String phoneCode) {
    if (phoneCode.startsWith("+")) {
      phoneCode = phoneCode.substring(1);
    }
    return phoneCode;
  }
}
