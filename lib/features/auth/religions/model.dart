part of 'bloc.dart';
class ReligionsData {
  late final List<ReligionModel> list;

  ReligionsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? [])
        .map((e) => ReligionModel.fromJson(e))
        .toList();
  }
}

class ReligionModel {
  late final int id;
  late final String _engName;
  late final String _arbName;

  String get name => TextHelper.text(_arbName, _engName);



  ReligionModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'] ?? 0;
    _engName = json['EngName'] ?? "";
    _arbName = json['ArbName'] ?? "";
  }
}
