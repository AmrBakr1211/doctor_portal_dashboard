part of "bloc.dart";

class InvestigationsData {
  late final List<InvestigationsModel> list;

  InvestigationsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => InvestigationsModel.fromJson(e)).toList();
  }
}

class InvestigationsModel {
  late final int id;
  late final int transNum;
  late final int doctorId;
  late final String doctorImage;
  late final String _doctorArbName;
  late final String _doctorEngName;
  late final String _respCenterArbName;
  late final String _respCenterEngName;
  late final String _payMethodEng;
  late final String _payMethodArb;
  late final String _transDate;
  late final num amount;
  late final String reportSpName;
  late final String rptId;
  late final bool isComplete;
  late final List<ServiceDetails> services;

  String get payMethod => TextHelper.text(_payMethodArb, _payMethodEng);

  String get title => TextHelper.text(_respCenterArbName, _respCenterEngName);

  String get doctorName => TextHelper.text(_doctorArbName, _doctorEngName);

  String get date => DateFormatHelper.shape1(_transDate);

  InvestigationsModel.fromJson(Map<String, dynamic> json) {
    id = json['thID'] ?? 0;
    _respCenterArbName = json['respCenterArbName'] ?? "";
    _respCenterEngName = json['respCenterEngName'] ?? "";
    // todo : need the doctor photo from api
    doctorId = json['doctorId'] ?? 0;
    _doctorArbName = json['doctorArbName'] ?? "";
    _doctorEngName = json['doctorEngName'] ?? "";
    doctorImage = json['doctorPhoto'] ?? "";
    transNum = json['transNum'];
    _payMethodEng = json['paymethodEng']??"";
    _payMethodArb = json['paymethodArb']??"";
    _transDate = json['transDate']??"";
    amount = json['amount'];
    reportSpName = json['report_spName']??"";
    rptId = json['rptId']??"";
    services = List.from(json['transDtl'] ?? []).map((e) => ServiceDetails.fromJson(e)).toList();
    isComplete = services.isNotEmpty;
  }
}

class ServiceDetails {
  late final int id;
  late final String _arbName;
  late final String _engName;

  String get name => TextHelper.text(_arbName, _engName);

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    id = json['dtlID'] ?? 0;
    _arbName = json['serviceArbName'] ?? "";
    _engName = json['serviceEngName'] ?? "";
  }
}
