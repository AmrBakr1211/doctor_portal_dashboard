part of 'bloc.dart';

class DownloadDocumentStates {}

class DownloadDocumentLoadingState extends DownloadDocumentStates {}

class DownloadDocumentFailedState extends DownloadDocumentStates {
  final String msg;
  final int? statusCode;


  DownloadDocumentFailedState({required this.msg, this.statusCode});
}

class DownloadDocumentSuccessState extends DownloadDocumentStates {
  final String msg;

  DownloadDocumentSuccessState({
    required this.msg,
  });
}