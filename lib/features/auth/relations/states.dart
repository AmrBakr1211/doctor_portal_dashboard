part of 'bloc.dart';

class RelationsStates {}

class GetRelationsLoadingState extends RelationsStates {}

class GetRelationsFailedState extends RelationsStates {
  final String msg;
  final int? statusCode;


  GetRelationsFailedState({required this.msg, this.statusCode});
}

class GetRelationsSuccessState extends RelationsStates {}