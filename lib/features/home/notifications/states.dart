part of 'bloc.dart';

class NotificationsStates {}

class GetNotificationsLoadingState extends NotificationsStates {}

class GetNotificationsFailedState extends NotificationsStates {
  final String msg;
  final int? statusCode;

  GetNotificationsFailedState({required this.msg, this.statusCode}) {
    showMessage(msg);
  }
}

class GetNotificationsSuccessState extends NotificationsStates {}
