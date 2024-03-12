import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../sign_in/bloc.dart';

part 'events.dart';
part 'states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  final DioHelper _dio;

  ProfileBloc(this._dio) : super(ProfileStates()) {
    on<GetProfileEvent>(_getData);
  }

  void _getData(
    GetProfileEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(GetProfileLoadingState());

    final response = await _dio.send(
      "api/Authorization/PatientAuthentication",
      data: {
        "PatientId": CacheHelper.id,
      },
    );
    if (response.isSuccess) {
      final model = UserModel.fromJson(response.data["data"]);
      await CacheHelper.saveData(model);
      emit(GetProfileSuccessState(list: model.relations));
    } else {
      emit(GetProfileFailedState(msg: response.msg, statusCode: response.statusCode));
    }
  }
}
