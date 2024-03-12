part of'bloc.dart';

class DoctorsEvents {}

class GetDoctorsEvent extends DoctorsEvents {}
class DoctorsSearchEvent extends DoctorsEvents {
  final String? keyword;

  DoctorsSearchEvent({this.keyword});
}