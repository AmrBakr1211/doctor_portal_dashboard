part of "bloc.dart";

class NationalitiesData {
  late final List<NationalityModel> list;

  NationalitiesData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data']["info"]['nationalities'] ?? []).map((e) => NationalityModel.fromJson(e)).toList();
  }
}

class NationalityModel {
  late final int id;
  late final String _engName;
  late final String _arbName;

  String get name => TextHelper.text(_arbName, _engName);

  NationalityModel.fromJson(Map<String, dynamic> json) {
    id = json['nationalityID'] ?? 0;
    _engName = json['engName'] ?? "";
    _arbName = json['arbName'] ?? "";
  }
}
