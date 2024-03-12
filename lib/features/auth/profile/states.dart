part of 'bloc.dart';

class ProfileStates {}

class GetProfileLoadingState extends ProfileStates {}

class GetProfileFailedState extends ProfileStates {
  final String msg;
  final int? statusCode;


  GetProfileFailedState({required this.msg, this.statusCode});
}

class GetProfileSuccessState extends ProfileStates {
  final List<RelationPatientModel> list;

  GetProfileSuccessState({required this.list});
}