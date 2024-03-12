part of "bloc.dart";
class NotificationsData {

  late final List<MyNotificationModel> list;

  NotificationsData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>MyNotificationModel.fromJson(e)).toList();
  }
}

class MyNotificationModel {
  late final int id;
  late final String title,body, token, status, code, _arDescription, _enDescription;
  late  String image;
  late final String macAddress;
  late final String regDate;

  String get description => TextHelper.text(_arDescription, _enDescription);


  MyNotificationModel.fromJson(Map<String, dynamic> json){
    id = json['NotifiID']??0;
    title = json['MessageTitle']??"";
    body = json['MessageBody']??"";
    token = json['Token']??"";
    status = json['MsgStatus']??"";
    code = json['Code']??"";
    _arDescription = json['DescriptionArb']??"";
    _enDescription = json['DescriptionEng']??"";
    image = json['Icon']??"";
    image = "memory"+image;
    macAddress = json['MacAddress']??"";
    regDate = DateFormat.yMMMMEEEEd().format(DateTime.parse(json['RegDate']??""));
  }
}