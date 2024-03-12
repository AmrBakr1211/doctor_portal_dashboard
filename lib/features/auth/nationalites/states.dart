part of 'bloc.dart';

class NationalitiesStates {}

class GetNationalitiesLoadingState extends NationalitiesStates {}

class GetNationalitiesFailedState extends NationalitiesStates {
  final String msg;
  final int? statusCode;


  GetNationalitiesFailedState({required this.msg, this.statusCode});
}

class GetNationalitiesSuccessState extends NationalitiesStates {}