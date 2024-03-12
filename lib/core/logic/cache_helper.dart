import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/sign_in/bloc.dart';

class CacheHelper {
  static late SharedPreferences _ref;

  static Future<void> init() async {
    _ref = await SharedPreferences.getInstance();
  }

  static String get lang {
    return _ref.getString("lang") ?? "en";
  }

  static String get forDate {
    String date = _ref.getString("forDate") ?? "";
    final dateTime = DateTime.parse("2020-09-26T18:14:00");

    print(date);
    if (date.isNotEmpty) {
      return DateFormat.yMd().add_jm().format(dateTime);
    }
    return date;
  }

  static bool get isAuthed {
    return _ref.getBool("isAuthed") ?? false;
  }

  static String get name {
    return lang == "en" ? _engName : _arabName;
  }

  static String get profileName {
    if(name.isEmpty)return "Mohamed Tarek";
    final list = name.split(" ");
    return "${list.first} ${list.last}";
  }

  static String get _engName {
    return _ref.getString("engName") ?? "";
  }

  static int get id {
    return _ref.getInt("id") ?? 0;
  }

  static String get _arabName {
    return _ref.getString("arabName") ?? "";
  }

  static String get image {
    return _ref.getString("image") ?? "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg";
  }

  static bool get isRememberChecked {
    return _ref.getBool("isRememberChecked") ?? false;
  }

  static Future<void> setLang(String lang) async {
    _ref.setString("lang", lang);
  }

  static Future<void> saveData(UserModel model) async {
    // todo: need notification while changing the patient vital signs i will listen for specific topic form the server
    _ref.setBool("isAuth", true);
    _ref.setInt("id", model.id);
    _ref.setString("image", model.image);
    _ref.setString("arabName", model.arbName);
    _ref.setString("engName", model.engName);
    _ref.setInt("id", model.id);
    _ref.setInt("fileNum", model.fileNum);
    _ref.setString("fileNum", model.telephone);
    _ref.setString("telephone", model.identityNo);
    _ref.setString("gender", model.gender);
    _ref.setBool("isInsurance", model.isInsurance);
    _ref.setBool("isValid", model.isValid);
    _ref.setString("address", model.address);
    _ref.setDouble("pulse", model.vitalSigns.pulse);
    _ref.setDouble("temperature", model.vitalSigns.temperature);
    _ref.setDouble("lowBloodPressure", model.vitalSigns.lowBloodPressure);
    _ref.setDouble("heightBloodPressure", model.vitalSigns.heightBloodPressure);
    _ref.setDouble("oxygenSaturation", model.vitalSigns.oxygenSaturation);
    _ref.setDouble("weight", model.vitalSigns.weight);
    _ref.setDouble("height", model.vitalSigns.height);
    _ref.setDouble("respiratoryRate", model.vitalSigns.respiratoryRate);
    _ref.setString("forDate", model.vitalSigns.forDate);
  }


  static Future<void> logOut() async {
    await _ref.clear();
  }

  static double get pulse {
    return _ref.getDouble("pulse") ?? 0;
  }

  static double get temperature {
    return _ref.getDouble("temperature") ?? 37.4;
  }

  static double get lowBloodPressure {
    return _ref.getDouble("lowBloodPressure") ?? 80;
  }

  static double get heightBloodPressure {
    return _ref.getDouble("heightBloodPressure") ?? 120;
  }

  static double get oxygenSaturation {
    return _ref.getDouble("oxygenSaturation") ?? 99;
  }

  static double get weight {
    return _ref.getDouble("weight") ?? 86.2;
  }
  static bool get isMale {
    return (_ref.getString("gender") ?? "M")=="M";
  }


  static double get height {
    return _ref.getDouble("height") ?? 184;
  }

  static double get respiratoryRate {
    return _ref.getDouble("respiratoryRate") ?? 77;
  }
}
