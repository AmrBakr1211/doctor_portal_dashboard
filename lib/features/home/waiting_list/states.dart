part of 'bloc.dart';

class GetWaitingListStates {}

class GetWaitingListLoadingState extends GetWaitingListStates {}

class GetWaitingListFailedState extends GetWaitingListStates {
  final String msg;
  final int? statusCode;

  GetWaitingListFailedState({required this.msg, this.statusCode});
}

class GetWaitingListSuccessState extends GetWaitingListStates {
  final List<PatientDataModel> list;

  GetWaitingListSuccessState({required this.list});
}
