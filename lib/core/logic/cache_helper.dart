import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/sign_in/bloc.dart';


class CacheHelper {
  static late SharedPreferences _ref;

  static Future<void> init() async {
    _ref = await SharedPreferences.getInstance();
  }
  static String get profileName {
    final list = name.split(" ");
    return list.first + " " + list.last;
  }
  static String get lang {
    return _ref.getString("lang") ?? "en";
  }

  static int get sysID {
    return _ref.getInt("sysID") ?? 0;
  }

  static String get sysCode {
    return _ref.getString("sysCode") ?? "";
  }

  static int get docID {
    return _ref.getInt("docID") ?? 0;
  }

  static bool get isAuthed {
    return _ref.getBool("isAuthed") ?? false;
  }

  static String get docCode {
    return _ref.getString("docCode") ?? "";
  }

  static String get name {
    return lang == "en" ? _docEngName : _docArbName;
  }

  static String get spec {
    return lang == "en" ? _specEngName : _specArbName;
  }

  static String get _docEngName {
    return _ref.getString("docEngName") ?? "";
  }

  static String get _docArbName {
    return _ref.getString("docArbName") ?? "";
  }

  static String get image {
    return _ref.getString("image") ?? "";
  }

  static String get _specArbName {
    return _ref.getString("specArbName") ?? "";
  }

  static bool get isRememberChecked {
    return _ref.getBool("isRememberChecked") ?? false;
  }

  static String get _specEngName {
    return _ref.getString("specEngName") ?? "";
  }

  static Future<void> setLang(String lang) async {
    _ref.setString("lang", lang);
  }

  static Future<void> saveData(UserModel model) async {
    _ref.setBool("isAuthed", true);
    _ref.setInt("sysID", model.sysID);
    _ref.setString("sysCode", model.sysCode);
    _ref.setInt("docID", model.docID);
    _ref.setString("docCode", model.docCode);
    _ref.setString("docEngName", model.docEngName);
    _ref.setString("docArbName", model.docArbName);
    _ref.setString("image", model.image);
    _ref.setString("specArbName", model.specArbName);
    _ref.setString("specEngName", model.specEngName);
    _ref.setBool("isRememberChecked", model.isRememberChecked);
  }

  static Future<void> logOut() async {
    bool isRememberCheck = isRememberChecked;
    String sysCodeNew = sysCode;
    await _ref.clear();
    _ref.setBool("isRememberChecked", isRememberCheck);
    _ref.setString("sysCode", sysCodeNew);
  }
}
