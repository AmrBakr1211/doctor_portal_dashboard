import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../views/home/view.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  final DioHelper _dio;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  // final userIdController = TextEditingController(text: CacheHelper.isRememberChecked ? CacheHelper.sysCode : "");
  final userIdController = TextEditingController(text: "236");
  // final passwordController = TextEditingController();
  final passwordController = TextEditingController(text: "123456");
  bool isRememberChecked = CacheHelper.isRememberChecked;

  SignInBloc(this._dio) : super(SignInStates()) {
    on<SignInEvent>(_sendData);
  }

  void _sendData(
      SignInEvent event,
      Emitter<SignInStates> emit,
      ) async {
    if (formKey.currentState!.validate()) {
      emit(SignInLoadingState());
      final response = await _dio.send(
        "api/DoctorsClinicManagement/Login",
        data: {"Code": userIdController.text, "Password": passwordController.text},
      );
      if (response.isSuccess) {
        final model = UserData.fromJson(response.data).userModel;
        if (model != null) {
          model.isRememberChecked = isRememberChecked;
          await CacheHelper.saveData(model);
          emit(SignInSuccessState(msg: response.msg));
        } else {
          emit(SignInFailedState(msg: response.msg, statusCode: response.statusCode));
        }
      } else {
        emit(SignInFailedState(msg: response.msg, statusCode: response.statusCode));
      }
    } else {
      validateMode = AutovalidateMode.onUserInteraction;
    }
  }

}
