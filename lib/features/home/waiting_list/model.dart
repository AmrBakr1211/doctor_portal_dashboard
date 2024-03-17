part of "bloc.dart";

class WaitingListData {
  late final List<PatientDataModel> list;

  WaitingListData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => PatientDataModel.fromJson(e)).toList();
  }
}

class PatientDataModel {
  late final PatientModel PatInfo;
  late final List<ICDModel> icdList;

  PatientDataModel.fromJson(Map<String, dynamic> json) {
    print(json);
    // PatInfo = PatientModel.fromJson(json['PatInfo']);
    // icdList = List.from(json['ICDiagnosis'] ?? []).map((e) => ICDModel.fromJson(e)).toList();
  }
}
