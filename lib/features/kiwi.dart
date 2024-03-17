import 'package:kiwi/kiwi.dart';

import '../core/logic/dio_helper.dart';
import 'auth/sign_in/bloc.dart';
import 'auth/sign_out/bloc.dart';
import 'auth/toggle_lang/bloc.dart';
import 'home/waiting_list/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerSingleton((container) => DioHelper());

  // auth
  container.registerFactory((container) => SignInBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => GetWaitingListBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => SignOutBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => ToggleLangBloc());



}
