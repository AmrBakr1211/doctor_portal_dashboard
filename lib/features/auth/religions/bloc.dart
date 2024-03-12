import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class ReligionsBloc extends Bloc<ReligionsEvents, ReligionsStates> {
  final DioHelper _dio;

  ReligionsBloc(this._dio) : super(ReligionsStates()) {
    on<GetReligionsEvent>(_getData);
  }

  List<ReligionModel> list = [];
  int? selectedIndex;


  List<String> get stringList {
    return list.map((e) => e.name).toList();
  }

  void _getData(
    GetReligionsEvent event,
    Emitter<ReligionsStates> emit,
  ) async {
    emit(GetReligionsLoadingState());

    final response = await _dio.get("api/General/GetRelegions");
    if (response.isSuccess) {
      list = ReligionsData.fromJson(response.data).list;
      emit(GetReligionsSuccessState());
    } else {
      emit(GetReligionsFailedState(
          msg: response.msg, statusCode: response.statusCode));
    }
  }
}
