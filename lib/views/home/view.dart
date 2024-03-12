import 'package:app/views/home/pages/claims/view.dart';
import 'package:app/views/home/pages/waiting_list/view.dart';
import 'package:flutter/material.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/views/home/pages/dashboard/view.dart';
import 'package:app/views/home/pages/soon.dart';
import 'package:app/views/home/platforms/mobile.dart';
import 'package:app/views/home/platforms/web.dart';

import '../../core/design/app_image.dart';
import '../../routes.dart';
import 'components/side_nav_bar.dart';
import 'components/top_nav_bar.dart';
import 'pages/forms/view.dart';

class HomeView extends StatefulWidget {
  static const route = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeViewMobile(
        sideNavBar: sideNavBar,
        navigator: navigator,
        topNavBar: topNavBar,
      ),
      web: HomeViewWeb(
        navigator: navigator,
        sideNavBar: sideNavBar,
        topNavBar: topNavBar,
      ),
    );
  }

  int currentIndex = 0;
  String currentTitle = "DashBoard";

  Widget get sideNavBar {
    return SideNavBar(
      navKey: navKey,
      currentIndex: currentIndex,
      onChange: (value, title) {
        currentIndex = value;
        currentTitle = title;
        setState(() {});
      },
    );
  }

  Widget get topNavBar {
    return TopNavBar(navKey: navKey, title: currentTitle);
  }

  Widget get navigator {
    return Navigator(
      key: navKey,
      initialRoute: DashBoardPage.route,
      reportsRouteUpdateToEngine: true,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case DashBoardPage.route:
            return getPageRoute(const DashBoardPage(), name: DashBoardPage.route);
          case WaitingListPage.route:
            return getPageRoute(const WaitingListPage(), name: WaitingListPage.route);
          case ClaimsPage.route:
            return getPageRoute(const ClaimsPage(), name: ClaimsPage.route);
          case SoonView.route:
            final String title = settings.arguments as String;
            return getPageRoute(SoonView(title: title), name: SoonView.route);
          case FormsPage.route:
            return getPageRoute(const FormsPage(), name: FormsPage.route);
          default:
            return AppRoutes.errorRoute("From Home Navigator${settings.name ?? "NUll"}");
        }
      },
    );
  }
}
