import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/logic/text_helper.dart';

part 'events.dart';
part 'model.dart';
part 'states.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  final DioHelper _dio;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;

  SignInBloc(this._dio) : super(SignInStates()) {
    on<SignInEvent>(_sendData);
  }
  final userIdController = TextEditingController(text: "2356445045");
  final phoneController = TextEditingController(text: "0565102258");
  bool isRememberChecked = CacheHelper.isRememberChecked;

  void _sendData(
    SignInEvent event,
    Emitter<SignInStates> emit,
  ) async {
    if (formKey.currentState!.validate()) {
      emit(SignInLoadingState());
      final response = await _dio.send(
        "api/Authorization/PatientAuthentication",
        data: {
          "PatientId": "0",
          "logintype": userIdController.text.length < 10 ? "mrn" : "id",
          "logincode": userIdController.text,
          "loginphone": phoneController.text,
          "fbToken": "",
          "typeofDevice": "web",
          "Lang": CacheHelper.lang.toUpperCase()
        },
      );
      print(response.data);
      if (response.isSuccess) {
        final model = UserModel.fromJson(response.data["data"]);
        await CacheHelper.saveData(model);
        emit(SignInSuccessState(msg: response.msg, otp: model.randCode, phone: phoneController.text));
      } else {
        emit(SignInFailedState(msg: response.msg, statusCode: response.statusCode));
      }
    } else {
      validateMode = AutovalidateMode.onUserInteraction;
    }
  }

  String? validateUserId(String? value) {
    if (value!.isEmpty) {
      return "FileNum  / Id Number Must Be Not Empty";
    }
    return null;
  }
}
