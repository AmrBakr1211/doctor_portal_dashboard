part of "bloc.dart";

class AppointmentsData {
  late final List<AppointmentModel> list;

  AppointmentsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => AppointmentModel.fromJson(e)).toList();
  }
}

class AppointmentModel {
  late final int bookingID, locationID, PatientID, doctorID, docSpecId, serviceID, transHdrId;
  late final String _patientEngName, _patientArbName, _docArbName, _docEngName, _arbDocSpec, _engDocSpec;
  late final num servicePrice;
  late final bool isAttend, isOnline, isPaid, isEdit, isFreeRevisit;
  late final String _engService, _arbService, _arbLocation, _engLocation, _engHint, _arabHint;

  late final String doctorPhoto, _appTime;

  String get date {
    final list = _appTime.split(" ");
    return DateFormatHelper.shape1(list[0]) + " " + list[1] + " " + list[2];
  }

  String get patientName => TextHelper.text(_patientArbName, _patientEngName);

  String get serviceName => TextHelper.text(_arbService, _engService);

  String get location => TextHelper.text(_arbLocation, _engLocation);

  String get doctorSpec => TextHelper.text(_arbDocSpec, _engDocSpec);

  String get doctorName => TextHelper.text(_docArbName, _docEngName);

  String get hint => TextHelper.text(_arabHint, _engHint);

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    bookingID = json['bookingID'] ?? 0;
    locationID = json['locationID'] ?? 0;
    PatientID = json['PatientID'] ?? 0;
    _patientEngName = json['patEngName'] ?? "";
    _patientArbName = json['patArbName'] ?? "";
    doctorID = json['doctorID'] ?? 0;
    _docEngName = json['docEngName'] ?? "";
    _docArbName = json['docArbName'] ?? "";
    docSpecId = json['docSpecId'] ?? 0;
    // todo: wait for google map link for the location
    _engDocSpec = json['docSpecEngName'] ?? "";
    _arbDocSpec = json['docSpecArbName'] ?? "";
    _appTime = json['appTime'] ?? "";
    serviceID = json['serviceID'] ?? 0;
    servicePrice = json['servicePrice'] ?? 0;
    isFreeRevisit = json['isFreeRevisit'] ?? false;
    isAttend = json['isAttend'] ?? false;
    isOnline = json['isOnline'] ?? false;
    isPaid = json['isPaid'] ?? false;
    isEdit = json['isEdit'] ?? false;
    transHdrId = json['transHdrId'] ?? 0;
    _engService = json['appEngService'] ?? "";
    _arbService = json['appArbService'] ?? "";
    _arbLocation = json['locationArbAdress'] ?? "";
    _engLocation = json['locationEngAdress'] ?? "";
    _engHint = json['appGuidlinesEng'] ?? "";
    _arabHint = json['appGuidlinesArb'] ?? "";
    doctorPhoto = json['doctorPhoto'] ?? "";
  }
}
