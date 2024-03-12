part of'bloc.dart';

class InvestigationsEvents {}

class GetInvestigationsEvent extends InvestigationsEvents {}
class InvestigationsSearchEvent extends InvestigationsEvents {
  final String? keyword;

  InvestigationsSearchEvent({this.keyword});
}