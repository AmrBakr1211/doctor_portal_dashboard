part of 'bloc.dart';

class UserData {
  late final String requestId;
  late final int code;
  late final String errorMessage;
  UserModel? userModel;

  UserData.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    code = json['code'];
    errorMessage = json['error_message'];
    if (((json['data'] ?? []) as List).isNotEmpty) {
      userModel = UserModel.fromJson(json['data'][0]);
    }
  }
}

class UserModel {
  late final int sysID;
  late final String sysCode;
  late final int docID;
  late final String docCode;
  late final String docEngName;
  late final String docArbName;
  late final String specEngName;
  late final String specArbName;
  late final String image;
  bool isRememberChecked = false;

  UserModel.fromJson(Map<String, dynamic> json) {
    sysID = json['SysID'] ?? 0;
    sysCode = json['SysCode'] ?? "";
    docID = json['DocID'] ?? 0;
    docCode = json['DocCode'] ?? "";
    docEngName = json['DocEngName'] ?? "";
    docArbName = json['DocArbName'] ?? "";
    specEngName = json['SpecEngName'] ?? "";
    specArbName = json['SpecArbName'] ?? "";
    image = json['PhotoProfile'] ?? "";
  }
}
