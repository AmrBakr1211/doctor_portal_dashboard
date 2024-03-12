import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class DoctorsBloc extends Bloc<DoctorsEvents, DoctorsStates> {
  final DioHelper _dio;

  DoctorsBloc(this._dio) : super(DoctorsStates()) {
    on<GetDoctorsEvent>(_getData);
    on<DoctorsSearchEvent>(_search);

  }

  int selectedSpecialityId = 0;
  late List<DoctorModel> _list;

  void _getData(
    GetDoctorsEvent event,
    Emitter<DoctorsStates> emit,
  ) async {
    emit(GetDoctorsLoadingState());
    final response = await _dio.send("api/Booking/Doctors", data: {
      "specID": selectedSpecialityId,
      "IsOnline": false,
    });
    if (response.isSuccess) {
      _list = DoctorsData.fromJson(response.data).list;

      emit(GetDoctorsSuccessState(list: _list));
    } else {
      emit(GetDoctorsFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }

  Future<void> _search(DoctorsSearchEvent event, Emitter<DoctorsStates> emit) async {
    if (event.keyword == null || event.keyword!.isEmpty) {
      emit(GetDoctorsSuccessState(list: _list));
    } else {
      final list = _list
          .where((element) => element.name.toLowerCase().contains(event.keyword!.toLowerCase()) || element.name.contains(event.keyword!))
          .toList();
      emit(GetDoctorsSuccessState(list: list));
    }
  }
}
