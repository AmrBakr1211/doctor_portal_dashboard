part of 'bloc.dart';

class DoctorsStates {}

class GetDoctorsLoadingState extends DoctorsStates {}

class GetDoctorsFailedState extends DoctorsStates {
  final String msg;
  final int? statusCode;


  GetDoctorsFailedState({required this.msg, this.statusCode});
}

class GetDoctorsSuccessState extends DoctorsStates {
  final List<DoctorModel> list;

  GetDoctorsSuccessState({required this.list});
}