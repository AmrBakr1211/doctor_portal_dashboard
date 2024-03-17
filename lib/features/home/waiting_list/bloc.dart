import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../shared_models/icd.dart';
import '../../shared_models/patient.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class GetWaitingListBloc extends Bloc<GetWaitingListEvents, GetWaitingListStates> {
  final DioHelper _dio;

  GetWaitingListBloc(this._dio) : super(GetWaitingListStates()) {
    on<GetWaitingListEvent>(_getData);
    // on<WaitingListSearchEvent>(_search);
  }

  late WaitingListData _model;

  Future<void> _getData(
    GetWaitingListEvent event,
    Emitter<GetWaitingListStates> emit,
  ) async {
    if (event.withLoading) emit(GetWaitingListLoadingState());

    final response = await _dio.send("api/DoctorsClinicManagement/GetDoctorWaitingList", data: {
      "DoctorID": CacheHelper.docID,
      // "FromDate": event.selectedDate,
      // "ToDate": event.selectedDate,
      // // todo remove the fake date
      "FromDate": "2024-01-04",
      "ToDate": "2024-01-04",
    });
    if (response.isSuccess) {
      _model = WaitingListData.fromJson(response.data);
      emit(
        GetWaitingListSuccessState(list: _model.list),
      );
    } else {
      emit(GetWaitingListFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }

  // Future<void> _search(WaitingListSearchEvent event, Emitter<GetWaitingListStates> emit) async {
  //   if (event.keyword == null || event.keyword!.isEmpty) {
  //     emit(
  //       GetWaitingListSuccessState(list: _model.list),
  //     );
  //   }
  //
  //   emit(GetWaitingListSuccessState(
  //     list: _model.list
  //         .where(
  //           (element) =>
  //               element.name.toLowerCase().contains(event.keyword!.toLowerCase()) ||
  //               element.mobile.contains(event.keyword!) ||
  //               element.patientId.toString().contains(event.keyword!),
  //         )
  //         .toList(),
  //   ));
  // }
}
