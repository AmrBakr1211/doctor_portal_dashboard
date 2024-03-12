part of "bloc.dart";

class DoctorsData {
  late final List<DoctorModel> list;

  DoctorsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => DoctorModel.fromJson(e)).toList();
  }
}

class DoctorModel {
  late final int doctorID;
  late final String _engName, _arbName;
  late final int servicePrice;
  late final int specID;
  late final String _specialityEngName, _specialityArbName;
  late final int facilityID;
  late final String facilityName;
  late final bool isOnline;
  late final String status;
  late final int rates;
  late final int stars;
  late final ServiceInfo serviceInfo;
  late final DoctorProfile doctorProfile;

  String get name {
    if (CacheHelper.lang == "en") {
      if (_engName.isEmpty) {
        return _arbName;
      }
      return _engName;
    } else {
      if (_arbName.isEmpty) {
        return _engName;
      }
      return _arbName;
    }
  }

  String get speciality {
    if (CacheHelper.lang == "en") {
      if (_specialityEngName.isEmpty) {
        return _specialityArbName;
      }
      return _specialityEngName;
    } else {
      if (_specialityArbName.isEmpty) {
        return _specialityEngName;
      }
      return _specialityArbName;
    }
  }

  DoctorModel.fromJson(Map<String, dynamic> json) {
    doctorID = json['doctorID'];
    _engName = json['engName'] ?? "";
    _arbName = json['arbName'] ?? "";
    servicePrice = json['servicePrice'];
    specID = json['specID'];
    _specialityEngName = json['specialityEngName'] ?? "";
    _specialityArbName = json['specialityArbName'] ?? "";
    facilityID = json['facilityID'];
    facilityName = json['facilityName'];
    isOnline = json['isOnline'];
    status = json['status'];
    rates = json['rates'];
    stars = json['stars'];
    serviceInfo = ServiceInfo.fromJson(json['serviceInfo']);
    doctorProfile = DoctorProfile.fromJson(json['doctorProfile']);
  }
}

class ServiceInfo {
  late final int serviceID;
  late final num price;
  late final String serviceCode, _engName, _arbName;


  String get name {
    if (CacheHelper.lang == "en") {
      if (_engName.isEmpty) {
        return _arbName;
      }
      return _engName;
    } else {
      if (_arbName.isEmpty) {
        return _engName;
      }
      return _arbName;
    }
  }

  ServiceInfo.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceCode = json['serviceCode'];
    _engName = json['serviceEngName']??"";
    _arbName = json['serviceArbName']??"";
    price = json['servicePrice']??0;
  }
}

class DoctorProfile {
  late final String certificatesArb, certificatesEng, experienceArb, experienceEng, image;

  DoctorProfile.fromJson(Map<String, dynamic> json) {
    certificatesArb = json['certificatesArb'] ?? "";
    certificatesEng = json['certificatesEng'] ?? "";
    experienceArb = json['experienceArb'] ?? "";
    experienceEng = json['experienceEng'] ?? "";
    image = json['profilePhoto'] ?? "";
  }
}
