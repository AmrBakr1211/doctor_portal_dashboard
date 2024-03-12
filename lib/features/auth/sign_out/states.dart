part of 'bloc.dart';

class SignOutStates {}

class SignOutLoadingState extends SignOutStates {
  SignOutLoadingState() {
    showLoading();
  }
}

class SignOutSuccessState extends SignOutStates {
  final String msg;

  SignOutSuccessState({required this.msg}) {
    // navigateTo(LoginView.route, keepHistory: false, closeLoading: true);
    showMessage(msg, type: MessageType.success);
  }
}

class SignOutFailedState extends SignOutStates {
  final String msg;

  SignOutFailedState({required this.msg}) {
    Navigator.pop(navigatorKey.currentContext!);
    showMessage(msg);
  }
}
