class ICDModel {
  late final int transactionId;
  late final String code;
  late final String desc;
  late final String remarks;
  late final int id;
  late final String date;
  late String? cancelDate;

  ICDModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    transactionId = json['tdmddId'] ?? 0;
    date = json['regDate'] ?? "";
    code = json['code'] ?? "";
    remarks = json['remarks'] ?? "";
    desc = json['desc'] ?? "";
    String cancelDate2 = json['cancelDate'] ?? "";
    if (cancelDate2.isNotEmpty) {
      bool isZero = cancelDate2.split("T")[1] == "00:00:00";
      if (isZero) {
        cancelDate = null;
      } else {
        cancelDate = cancelDate2;
      }
    } else {
      cancelDate = cancelDate2;
    }
  }
}
