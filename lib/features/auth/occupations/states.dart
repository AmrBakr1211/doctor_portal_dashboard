part of 'bloc.dart';

class OccupationsStates {}

class GetOccupationsLoadingState extends OccupationsStates {}

class GetOccupationsFailedState extends OccupationsStates {
  final String msg;
  final int? statusCode;


  GetOccupationsFailedState({required this.msg, this.statusCode});
}

class GetOccupationsSuccessState extends OccupationsStates {}