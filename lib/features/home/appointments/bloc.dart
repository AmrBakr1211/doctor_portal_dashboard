import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/logic/date_format_helper.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvents, AppointmentsStates> {
  final DioHelper _dio;

  AppointmentsBloc(this._dio) : super(AppointmentsStates()) {
    on<GetAppointmentsEvent>(_getData);
  }

  void _getData(
    GetAppointmentsEvent event,
    Emitter<AppointmentsStates> emit,
  ) async {
    emit(GetAppointmentsLoadingState());
    final response = await _dio.get("api/Booking/GetBookings?patientID=${CacheHelper.id}&cancel");
    if (response.isSuccess) {
      final list = AppointmentsData.fromJson(response.data).list;
      emit(GetAppointmentsSuccessState(list: list));
    } else {
      emit(GetAppointmentsFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }
}
