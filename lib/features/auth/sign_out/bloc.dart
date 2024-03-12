import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';

part 'events.dart';
part 'states.dart';

class SignOutBloc extends Bloc<SignOutEvents, SignOutStates> {
  final DioHelper _dioHelper;

  SignOutBloc(this._dioHelper) : super(SignOutStates()) {
    on<SignOutEvent>(_sendData);
  }

  Future<void> _sendData(SignOutEvent event, Emitter<SignOutStates> emit) async {
    emit(SignOutLoadingState());
    final resp = await _dioHelper.send("");
    if (resp.isSuccess) {
      await CacheHelper.logOut();
      emit(SignOutSuccessState(msg: resp.msg));
    } else {
      emit(SignOutFailedState(msg: resp.msg));
    }
  }
}
