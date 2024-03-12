import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class OccupationsBloc extends Bloc<OccupationsEvents, OccupationsStates> {
  final DioHelper _dio;

  OccupationsBloc(this._dio) : super(OccupationsStates()) {
    on<GetOccupationsEvent>(_getData);
  }

  List<OccupationModel> list = [];
  int? selectedIndex;
  List<String> get stringList {
    return list.map((e) => e.name).toList();
  }

  void _getData(
    GetOccupationsEvent event,
    Emitter<OccupationsStates> emit,
  ) async {
    emit(GetOccupationsLoadingState());

    final response = await _dio.get("api/General/GetOccupations");
    if (response.isSuccess) {
      list = OccupationsData.fromJson(response.data).list;
      emit(GetOccupationsSuccessState());
    } else {
      emit(GetOccupationsFailedState(
          msg: response.msg, statusCode: response.statusCode));
    }
  }
}
