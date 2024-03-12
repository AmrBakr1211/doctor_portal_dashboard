import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';

part 'events.dart';
part 'states.dart';
class DownloadDocumentBloc extends Bloc<DownloadDocumentEvents, DownloadDocumentStates> {
  final DioHelper _dio;

  DownloadDocumentBloc(this._dio) : super(DownloadDocumentStates()) {
    on<DownloadDocumentEvent>(_sendData);
  }

  void _sendData(
    DownloadDocumentEvent event,
    Emitter<DownloadDocumentStates> emit,
  ) async {
    emit(DownloadDocumentLoadingState());
    final response = await _dio.send(
      "api/Transactions/DocumentsDownload",
      data: {
        "value": event.thID,
        "spName": event.spName,
        "rptID": event.rptID,
      },
    );
    if (response.isSuccess) {
      // todo how can i download this file it return on the response
      emit(DownloadDocumentSuccessState(msg: response.msg));
    } else {
      emit(DownloadDocumentFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }
}
