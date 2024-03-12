import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class SpecialitiesBloc extends Bloc<SpecialitiesEvents, SpecialitiesStates> {
  final DioHelper _dio;

  SpecialitiesBloc(this._dio) : super(SpecialitiesStates()) {
    on<GetSpecialitiesEvent>(_getData);
  }


  void _getData(
    GetSpecialitiesEvent event,
    Emitter<SpecialitiesStates> emit,
  ) async {
    emit(GetSpecialitiesLoadingState());
    final response = await _dio.get("api/Booking/Specialites?IsVideoSession=0");
    if (response.isSuccess) {
      final list = SpecialitiesData.fromJson(response.data).list;
      emit(GetSpecialitiesSuccessState(list: list));
    } else {
      emit(GetSpecialitiesFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }


}
