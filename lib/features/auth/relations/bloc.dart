import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class RelationsBloc extends Bloc<RelationsEvents, RelationsStates> {
  final DioHelper _dio;

  RelationsBloc(this._dio) : super(RelationsStates()) {
    on<GetRelationsEvent>(_getData);
  }

  List<RelationModel> list = [];
  int? selectedIndex;


  List<String> get stringList {
    return list.map((e) => e.name).toList();
  }

  void _getData(
    GetRelationsEvent event,
    Emitter<RelationsStates> emit,
  ) async {
    emit(GetRelationsLoadingState());

    final response = await _dio.get("api/General/GetRelations");
    if (response.isSuccess) {
      list = RelationsData.fromJson(response.data).list;
      emit(GetRelationsSuccessState());
    } else {
      emit(GetRelationsFailedState(
          msg: response.msg, statusCode: response.statusCode));
    }
  }
}
