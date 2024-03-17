part of 'bloc.dart';

class SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInFailedState extends SignInStates {
  final String msg;
  final int? statusCode;

  SignInFailedState({required this.msg, this.statusCode}) {
    showMessage(msg);
  }
}

class SignInSuccessState extends SignInStates {
  final String msg;

  SignInSuccessState({
    required this.msg,
  }) {
    navigateTo(HomeView.route, keepHistory: false);
  }
}
