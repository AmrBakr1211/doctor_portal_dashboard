part of 'bloc.dart';

class SpecialitiesStates {}

class GetSpecialitiesLoadingState extends SpecialitiesStates {}

class GetSpecialitiesFailedState extends SpecialitiesStates {
  final String msg;
  final int? statusCode;


  GetSpecialitiesFailedState({required this.msg, this.statusCode});
}

class GetSpecialitiesSuccessState extends SpecialitiesStates {
  final List<SpecialityModel>list;

  GetSpecialitiesSuccessState({required this.list});
}