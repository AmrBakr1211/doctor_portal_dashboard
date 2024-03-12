part of'bloc.dart';

class DownloadDocumentEvents {}

class DownloadDocumentEvent extends DownloadDocumentEvents {
  final int thID;
  final String spName,rptID;

  DownloadDocumentEvent({required this.thID,required this.spName,required this.rptID});
}
