part of 'bloc.dart';

class RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterFailedState extends RegisterStates {
  final String msg;
  final int? statusCode;


  RegisterFailedState({required this.msg, this.statusCode}){
    showMessage(msg);
  }
}

class RegisterSuccessState extends RegisterStates {
  final String msg;

  RegisterSuccessState({
    required this.msg,
  }){
    showMessage(msg,type: MessageType.success);
  }
}