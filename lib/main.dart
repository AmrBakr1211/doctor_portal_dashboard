import 'views/login/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import 'core/app_theme.dart';
import 'core/logic/bloc_observer.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';
import 'features/auth/toggle_lang/bloc.dart';
import 'features/kiwi.dart';
import 'routes.dart';
import 'views/home/view.dart';

Future<void> main() async {
  await init();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      startLocale: Locale(CacheHelper.lang),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
  );
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  initKiwi();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final langBloc = KiwiContainer().resolve<ToggleLangBloc>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1512, 982),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocConsumer(
            bloc: langBloc,
            listener: (context, state) {
              if (state is ToggleLangState) {
                context.setLocale(Locale(state.lang));
              }
            },
            builder: (context, state) {
              return MaterialApp(
                initialRoute: CacheHelper.isAuthed ? LoginView.route : LoginView.route,
                navigatorKey: navigatorKey,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                // onGenerateRoute: (settings) {
                //   // return getPageRoute(const HomeView(), name: HomeView.route);
                //   // return getPageRoute(const LoginView(), name: LoginView.route);
                //   switch (settings.name) {
                //     case LoginView.route:
                //       return getPageRoute(const LoginView(), name: LoginView.route);
                //     case HomeView.route:
                //       return getPageRoute(const HomeView(), name: HomeView.route);
                //     default:
                //       return AppRoutes.errorRoute("From Main Navigator${settings.name ?? "NUll"}");
                //   }
                // },
                title: context.locale.languageCode == "en" ? 'Doctor Portal' : "مستشفى عبد اللطيف جميل",
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: AppTheme.light,
              );
            });
      },
    );
  }
}
