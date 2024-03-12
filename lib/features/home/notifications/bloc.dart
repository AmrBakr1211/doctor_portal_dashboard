import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/logic/helper_methods.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class NotificationsBloc extends Bloc<NotificationsEvents, NotificationsStates> {
  final DioHelper _dio;

  NotificationsBloc(this._dio) : super(NotificationsStates()) {
    on<GetNotificationsEvent>(_getData);
  }

  List<MyNotificationModel>?list ;

  void _getData(
      GetNotificationsEvent event,
    Emitter<NotificationsStates> emit,
  ) async {
    emit(GetNotificationsLoadingState());

    // todo: when new notification came append it to the notifications list
    final response = await _dio.get(
      "api/Management/GetPatientsNotifications",
      params: {
        "PatientID": 109904,
        // "PatientID": CacheHelper.id,
      },
    );
    if (response.isSuccess) {
      final model = NotificationsData.fromJson(response.data);
      list = model.list;
      emit(GetNotificationsSuccessState());
    } else {
      emit(GetNotificationsFailedState(
          msg: response.msg, statusCode: response.statusCode));
    }
  }
}
