import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/logic/date_format_helper.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class InvestigationsBloc extends Bloc<InvestigationsEvents, InvestigationsStates> {
  final DioHelper _dio;

  InvestigationsBloc(this._dio) : super(InvestigationsStates()) {
    on<GetInvestigationsEvent>(_getData);
    on<InvestigationsSearchEvent>(_search);
  }

  String selectedType = "L";

  int selectedPatientId = CacheHelper.id;

  int? selectedDateItem;

  List<DateTime?>? list;

  late List<InvestigationsModel> _list;

  void _getData(
    GetInvestigationsEvent event,
    Emitter<InvestigationsStates> emit,
  ) async {
    list?.forEach((element) {
      print(element);
    });
    emit(GetInvestigationsLoadingState());
    final response = await _dio.send("api/Transactions/GetSpecificTrans", data: {
      "patientID": selectedPatientId,
      "fromDate": list == null || list!.isEmpty
          ? DateFormat("y-MM-dd")
              .format(DateTime.now().subtract(const Duration(days: 40)))
          : DateFormat("y-MM-dd").format(list!.first!),
      "toDate": list == null || list!.isEmpty
          ? DateFormat("y-MM-dd").format(DateTime.now())
          : DateFormat("y-MM-dd").format(list!.last!),
      "respCenterType": selectedType,
    });
    if (response.isSuccess) {
      _list = InvestigationsData.fromJson(response.data).list;
      emit(GetInvestigationsSuccessState(list: _list));
    } else {
      if (response.statusCode == 204 && (response.data["data"] as List).isEmpty) {
        emit(GetInvestigationsSuccessState(list: []));
      } else {
        emit(GetInvestigationsFailedState(msg: response.msg, statusCode: response.statusCode));
      }
    }
  }

  Future<void> _search(InvestigationsSearchEvent event, Emitter<InvestigationsStates> emit) async {
    if (event.keyword == null || event.keyword!.isEmpty) {
      emit(GetInvestigationsSuccessState(list: _list));
    } else {
      final list = _list
          .where(
            (element) =>
                element.doctorName.toLowerCase().contains(event.keyword!.toLowerCase()) ||
                element.doctorName.contains(
                  event.keyword!,
                ),
          )
          .toList();
      emit(GetInvestigationsSuccessState(list: list));
    }
  }
}
