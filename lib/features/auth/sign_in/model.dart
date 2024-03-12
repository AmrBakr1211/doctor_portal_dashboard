part of 'bloc.dart';

class UserModel {
  late final int id, fileNum, accountID, age;
  late final String telephone, identityNo, gender, dateOfBirth;
  late final bool isInsurance, isValid;
  late final String maritalStatus,
      address,
      email,
      engName,
      image,
      arbName,
      randCode;
  late final VitalSignsModel vitalSigns;
  late final List<RelationPatientModel> relations;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'] ?? 0;
    fileNum = json['FileNum'] ?? 0;
    image = json['profilePhoto'] ?? "";
    arbName = json['ArbName'] ?? "";
    engName = json['EngName'] ?? "";
    telephone = json['Telephones'] ?? "";
    identityNo = json['IdentityNo'] ?? "";
    gender = json['Sex'] ?? "M";
    dateOfBirth = json['DOB'] ?? "";
    accountID = json['AccountID'] ?? 0;
    isInsurance = json['IsInsurance'] ?? false;
    randCode = json['RandCode'] ?? "";
    maritalStatus = json['MaritalStatus'] ?? "";
    age = json['Age'] ?? 0;
    address = json['Address'] ?? "";
    email = json['Email'] ?? "";
    isValid = json['IsValid'] ?? false;
    relations = List.from(json["PatRel"] ?? [])
        .map((e) => RelationPatientModel.fromJson(e))
        .toList();
    relations.insert(
        0,
        RelationPatientModel.fromJson({
          "ID": id,
          "FileNum": fileNum,
          "Telephones": telephone,
          "IdentityNo": identityNo,
          "Sex": gender,
          "DOB": dateOfBirth,
          "ArbName": arbName,
          "EngName": engName
        }));
    vitalSigns = VitalSignsModel.fromJson(json['VitalSigns'] ?? {});
  }
}

class VitalSignsModel {
  late double pulse,
      temperature,
      lowBloodPressure,
      heightBloodPressure,
      oxygenSaturation,
      weight,
      height,
      respiratoryRate;

  late final String forDate;
  late final String remarks;

  VitalSignsModel.fromJson(Map<String, dynamic> json) {
    heightBloodPressure = json['BloodPressureHi'] ?? 0;
    lowBloodPressure = json['BloodPressureLo'] ?? 0;
    temperature = json['Temperature'] ?? 0;
    height = json['Height'] ?? 0;
    weight = json['Weight'] ?? 0;
    oxygenSaturation = json['OxygenSaturation'] ?? 0;
    pulse = json['Pulse'] ?? 0;
    respiratoryRate = json['RespiratoryRate'] ?? 0;
    remarks = json['Remarks'] ?? "";
    forDate = json['ForDate'] ?? "";
  }
}

class RelationPatientModel {
  late final int id;
  late final int fileNum;
  late final String telephone;
  late final String identityNo;
  late final String gender;
  // late final String dateOfBirth;
  late final String _arbName;
  late final String _engName;

  String get name => TextHelper.text(_arbName, _engName);


  RelationPatientModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'] ?? 0;
    fileNum = json['FileNum'] ?? 0;
    telephone = json['Telephones'] ?? "";
    identityNo = json['IdentityNo'] ?? 0;
    gender = json['Sex'] ?? "";
    // dateOfBirth = json['DOB'] ?? "";
    _arbName = json['ArbName'] ?? "";
    _engName = json['EngName'] ?? "";
  }
}
