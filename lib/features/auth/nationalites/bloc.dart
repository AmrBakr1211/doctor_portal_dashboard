import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class NationalitiesBloc extends Bloc<NationalitiesEvents, NationalitiesStates> {
  final DioHelper _dio;

  NationalitiesBloc(this._dio) : super(NationalitiesStates()) {
    on<GetNationalitiesEvent>(_getData);
  }

  List<NationalityModel> list = [];
  int? selectedIndex;

  List<String> get stringList {
    return list.map((e) => e.name).toList();
  }

  void _getData(
    GetNationalitiesEvent event,
    Emitter<NationalitiesStates> emit,
  ) async {
    emit(GetNationalitiesLoadingState());

    final response = await _dio.get("api/General/GetNationalities");
    if (response.isSuccess) {
      list = NationalitiesData.fromJson(response.data).list;
      emit(GetNationalitiesSuccessState());
    } else {
      emit(GetNationalitiesFailedState(
          msg: response.msg, statusCode: response.statusCode));
    }
  }
}
