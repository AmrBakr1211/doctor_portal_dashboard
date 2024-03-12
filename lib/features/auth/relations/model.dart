part of 'bloc.dart';
class RelationsData {
  late final List<RelationModel> list;

  RelationsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? [])
        .map((e) => RelationModel.fromJson(e))
        .toList();
  }
}

class RelationModel {
  late final int id;
  late final String _engName;
  late final String _arbName;

  String get name => TextHelper.text(_arbName, _engName);


  RelationModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'] ?? 0;
    _engName = json['EngName'] ?? "";
    _arbName = json['ArbName'] ?? "";
  }
}
