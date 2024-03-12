part of "bloc.dart";

class SpecialitiesData {
  late List<SpecialityModel> list;

  SpecialitiesData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => SpecialityModel.fromJson(e)).toList();
    list.insert(
        0,
        SpecialityModel.fromJson({
          "specID": 0,
          "engName": "All Speciality",
          "arbName": "كل التخصصات",
        }));
  }
}

class SpecialityModel {
  late final int specID, doctorsCount;
  late final String _engName, _arbName;
  late final bool isVideoSession;

  String get name => TextHelper.text(_arbName, _engName);


  SpecialityModel.fromJson(Map<String, dynamic> json) {
    specID = json['specID'] ?? 0;
    _engName = json['engName'] ?? "";
    _arbName = json['arbName'] ?? "";
  }
}
