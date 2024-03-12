part of 'bloc.dart';

class InvestigationsStates {}

class GetInvestigationsLoadingState extends InvestigationsStates {}

class GetInvestigationsFailedState extends InvestigationsStates {
  final String msg;
  final int? statusCode;


  GetInvestigationsFailedState({required this.msg, this.statusCode});
}

class GetInvestigationsSuccessState extends InvestigationsStates {
  final List<InvestigationsModel> list;

  GetInvestigationsSuccessState({required this.list});
}