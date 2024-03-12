part of 'bloc.dart';

class AppointmentsStates {}

class GetAppointmentsLoadingState extends AppointmentsStates {}

class GetAppointmentsFailedState extends AppointmentsStates {
  final String msg;
  final int? statusCode;


  GetAppointmentsFailedState({required this.msg, this.statusCode});
}

class GetAppointmentsSuccessState extends AppointmentsStates {
  final List<AppointmentModel>list;

  GetAppointmentsSuccessState({required this.list});
}