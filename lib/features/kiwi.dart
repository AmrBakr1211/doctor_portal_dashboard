import 'package:kiwi/kiwi.dart';
import 'package:app/features/home/appointments/bloc.dart';
import 'package:app/features/home/doctors/bloc.dart';
import 'package:app/features/home/specialities/bloc.dart';

import '../core/logic/dio_helper.dart';
import 'auth/nationalites/bloc.dart';
import 'auth/occupations/bloc.dart';
import 'auth/profile/bloc.dart';
import 'auth/register/bloc.dart';
import 'auth/relations/bloc.dart';
import 'auth/religions/bloc.dart';
import 'auth/sign_in/bloc.dart';
import 'auth/sign_out/bloc.dart';
import 'auth/toggle_lang/bloc.dart';
import 'download_document/bloc.dart';
import 'home/investigations/bloc.dart';
import 'home/notifications/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerSingleton((container) => DioHelper());

  // auth
  container.registerFactory((container) => SignInBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => ProfileBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => RegisterBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => SignOutBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => NationalitiesBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => RelationsBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => ReligionsBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => OccupationsBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => ToggleLangBloc());


  // home
  container.registerFactory((container) => InvestigationsBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => AppointmentsBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => DoctorsBloc(container.resolve<DioHelper>()));
  container.registerFactory((container) => SpecialitiesBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => NotificationsBloc(container.resolve<DioHelper>()));
  container.registerSingleton((container) => DownloadDocumentBloc(container.resolve<DioHelper>()));

}
