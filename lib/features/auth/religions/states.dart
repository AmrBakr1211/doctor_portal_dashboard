part of 'bloc.dart';

class ReligionsStates {}

class GetReligionsLoadingState extends ReligionsStates {}

class GetReligionsFailedState extends ReligionsStates {
  final String msg;
  final int? statusCode;


  GetReligionsFailedState({required this.msg, this.statusCode});
}

class GetReligionsSuccessState extends ReligionsStates {}