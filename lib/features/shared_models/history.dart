
import 'package:intl/intl.dart';

import '../../core/logic/cache_helper.dart';
import 'icd.dart';
import 'service.dart';

class HistoryModel {
  late String _dateToShow, _timeToShow, _englishName, _arabicSpec, _englishSpec, _arabicName, title, desc;
  late List<String> listOfPDFs;
  late List<ICDModel> complainList,significantSignsSectionList;
  late List<ICDModel> icdList;
  late ServiceModel serviceModel;
  late int consultationId;

  String get doctorName {
    if (CacheHelper.lang == "en") {
      if (_englishName.isEmpty) {
        return _arabicName;
      }
      return _englishName;
    } else {
      if (_arabicName.isEmpty) {
        return _englishName;
      }
      return _arabicName;
    }
  }
  String get spec {
    if (CacheHelper.lang == "en") {
      if (_englishSpec.isEmpty) {
        return _arabicSpec;
      }
      return _englishSpec;
    } else {
      if (_arabicSpec.isEmpty) {
        return _englishSpec;
      }
      return _arabicSpec;
    }
  }

  String get dateToShow {
    DateFormat format = DateFormat("MM-dd-yyyy");
    final df = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    var time = df.parse(_timeToShow);
    String timeToShow = "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")} ${time.hour > 12 ? "PM" : "AM"}";
    var date = format.parse(_dateToShow);
    String dateText = "${date.day} ${DateFormat.MMM(CacheHelper.lang).format(date)}, $timeToShow";

    return dateText;
  }

  HistoryModel.fromJson(Map<String, dynamic> json) {
    _englishName = json['DoctorEngName'] ?? "";
    _arabicName = json['DoctorArbName'] ?? "";
    _englishSpec = json['SpecEngName'] ?? "";
    _arabicSpec = json['SpecArbName'] ?? "";
    consultationId = json['ConsultationTHID'] ?? 0;
    _dateToShow = json['VisitRegDate'] ?? "";
    _timeToShow = json['CheckInTime'] ?? "";
    serviceModel = ServiceModel.fromJson(json["Orders"] ?? {});
    listOfPDFs = [];
    listOfPDFs.add(serviceModel.laboratory);
    listOfPDFs.add(serviceModel.radiology);
    listOfPDFs.add(serviceModel.pharmacy);
    listOfPDFs.add(serviceModel.treatment);
    icdList = List.from(json['ICDs']??json['ICDiagnosis'] ?? []).map((e) => ICDModel.fromJson(e)).toList();
    significantSignsSectionList = List.from(json['SignificantSigns']?? []).map((e) => ICDModel.fromJson(e)).toList();
    complainList = List.from(json['Complains']?? json['ChifeComplain']?? []).map((e) => ICDModel.fromJson(e)).toList();
    title = icdList.isNotEmpty ? "${icdList.first.code} ${icdList.first.desc}" : "";
    desc = complainList.isNotEmpty ? complainList.first.desc : "";
  }
}