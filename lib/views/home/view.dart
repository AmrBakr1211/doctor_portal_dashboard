import 'package:app/core/design/responsive.dart';
import 'package:app/views/home/components/copyright.dart';
import 'package:app/views/home/pages/soon.dart';
import 'package:app/views/home/pages/waiting_list/view.dart';
import 'package:app/views/home/platforms/mobile.dart';
import 'package:app/views/home/platforms/web.dart';
import 'package:flutter/material.dart';
import '../../routes.dart';
import 'components/side_nav_bar.dart';
import 'components/top_nav_bar/top_nav_bar.dart';
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
    return Column(
      children: [
        Expanded(
          child: Responsive(
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
          ),
        ),
        CopyRight()
      ],
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
    return TopNavBar(title: currentTitle);
  }

  Widget get navigator {
    return Navigator(
      key: navKey,
      initialRoute: FormsPage.route,
      reportsRouteUpdateToEngine: true,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WaitingListPage.route:
            return getPageRoute(const WaitingListPage(), name: WaitingListPage.route);
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
