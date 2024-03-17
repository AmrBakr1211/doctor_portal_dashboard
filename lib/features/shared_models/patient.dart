import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

import '../../core/design/app_image.dart';
import '../../core/logic/cache_helper.dart';
import 'history.dart';
import 'icd.dart';

enum Gender { male, female }

class PatientModel {
  late int patientId;
  late DateTime _dateOfBirth;
  late String image, _arabicName, _englishName, _transDate, _aapt;
  late String _transTime, mobile, email, dateOfBirth, bloodPressure;
  late num temp,
      height,
      weight,
      bloodPressureLow,
      bloodPressureHigh,
      pulse,
      oxygenSaturation,
      respiratoryRate,
      headCircum;
  late String mrn;
  late int id;
  late Gender gender;
  late String address;
  late bool isUpcoming;
  late String allergies;
  late String numOfDuration;
  late String durationType;
  late List<ICDModel> icdsList;
  late List<HistoryModel> historyModelList;
  bool isDataCompleted = false;

  PatientModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse((json["ID"] ?? "").toString()) ?? 0;
    patientId = json["PatientID"] ?? 0;
    image = json[""] ?? "";
    _arabicName = json["PatientArbName"] ?? "";
    _englishName = json["PatientEngName"] ?? "";
    dateOfBirth = json["PatientDOB"] ?? "";
    convertShapeOfDateOfBirth();
    mobile = json["Telephone"] ?? "";
    mrn = json["PatientFileNum"] ?? "";
    _transDate = json["TRANS_DATE"] ?? 0;
    _transTime = json["TRANS_TIME"] ?? 0;
    _aapt = json["APPT"] ?? "0";
    gender = json["PatientSex"] == "F" ? Gender.female : Gender.male;
    isUpcoming = json["Type"] == "APPT";
  }

  void completeModelFromJson(Map<String, dynamic> json) {
    isDataCompleted = true;
    String duration = json["IllnessDuration"] ?? "";
    if (duration.isNotEmpty) {
      final parts = duration.split(" ");
      numOfDuration = parts[0];
      durationType = parts[1];
    }
    allergies = json["Allergy"] ?? "none";
    historyModelList = List.from(json["MedicalData"] ?? [])
        .map((e) => HistoryModel.fromJson(e))
        .toList();
    address = json["Address"] ?? "";
    email = json["Email"] ?? "";
    bloodPressureHigh = json["BloodPressureHi"] ?? 0;
    bloodPressureLow = json["BloodPressureLo"] ?? 0;
    bloodPressure = "$bloodPressureHigh / $bloodPressureLow";
    height = json["Height"] ?? 0;
    weight = json["Weight"] ?? 0;
    temp = json["Temperature"] ?? 0;
    pulse = json["Pulse"] ?? 0;
    oxygenSaturation = json["OxygenSaturation"] ?? 0;
    respiratoryRate = json["RespiratoryRate"] ?? 0;
    headCircum = json["HeadCircum"] ?? 0;
  }

  String get name {
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

  late DateTime regDate;

  String get dateToShow {
    DateFormat format = DateFormat("MM-dd-yyyy");
    regDate = format.parse(_transDate);
    String dateText =
        "${regDate.day} ${DateFormat.MMM(CacheHelper.lang).format(regDate)}";
    if (isUpcoming) {
      dateText += " ,${fixTimeShape(_aapt)}";
    } else {
      dateText += " ,${fixTimeShape(_transTime)}";
    }
    return dateText;
  }

  String fixTimeShape(String text) {
    int hours = int.tryParse(text.split(":").first) ?? 0;
    int minutes = int.tryParse(text.split(":").last) ?? 0;
    String period = hours > 12 ? "PM" : "AM";
    hours = hours > 12 ? hours - 12 : hours;
    String hoursText = hours.toString().padLeft(2, "0");
    String minutesText = minutes.toString().padLeft(2, "0");
    return "$hoursText:$minutesText $period";
  }

  int get age {
    int year = DateTime.now().year - _dateOfBirth.year;
    return year;
  }

  void convertShapeOfDateOfBirth() {
    DateFormat format = DateFormat("yyyy-dd-MM");
    _dateOfBirth = format.parse(dateOfBirth);
    // todo fix this date of birth
    dateOfBirth =
        "${_dateOfBirth.day} ${DateFormat.MMM(CacheHelper.lang).format(_dateOfBirth)}, ${_dateOfBirth.year}";
  }

  FailedImageType get failedImage {
    return gender == Gender.male
        ? FailedImageType.male
        : gender == Gender.female
            ? FailedImageType.female
            : FailedImageType.normal;
  }
}
