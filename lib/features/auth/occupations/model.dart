part of 'bloc.dart';

class OccupationsData {
  late final List<OccupationModel> list;

  OccupationsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? [])
        .map((e) => OccupationModel.fromJson(e))
        .toList();
  }
}

class OccupationModel {
  late final int id;
  late final String _engName;
  late final String _arbName;

  String get name => TextHelper.text(_arbName, _engName);

  OccupationModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'] ?? 0;
    _engName = json['EngName'] ?? "";
    _arbName = json['ArbName'] ?? "";
  }
}
