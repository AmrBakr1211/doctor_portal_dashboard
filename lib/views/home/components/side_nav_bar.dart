import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/views/home/pages/claims/view.dart';
import 'package:app/views/home/pages/dashboard/view.dart';
import 'package:app/views/home/pages/forms/view.dart';
import 'package:app/views/home/pages/waiting_list/view.dart';
import 'package:flutter/material.dart';

import '../pages/soon.dart';

class SideNavBar extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;
  final int currentIndex;
  final onChange;

  const SideNavBar({
    Key? key,
    required this.navKey,
    required this.currentIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  final list = [
    _Model(title: "Dashboard", icon: "dashboard.svg", route: DashBoardPage.route),
    _Model(title: "Waiting List", icon: "waiting_list.svg", route: WaitingListPage.route),
    _Model(title: "Claims", icon: "claims.svg", route: ClaimsPage.route),
    _Model(title: "In-Patient Wards", icon: "in_patient_wards.svg", route: SoonView.route),
    _Model(title: "Emergency Wards", icon: "emergency_wards.svg", route: SoonView.route),
    _Model(title: "Widgets", icon: "widgets.svg", route: SoonView.route),
    _Model(title: "Messages", icon: "messages.svg", route: SoonView.route),
    _Model(title: "Calender", icon: "calender.svg", route: SoonView.route),
    _Model(title: "Forms", icon: "forms.svg", route: FormsPage.route),
    _Model(title: "Reports", icon: "reports.svg", route: SoonView.route),
    _Model(title: "KPI", icon: "kpi.svg", route: SoonView.route),
    _Model(title: "Alerts", icon: "alerts.svg", route: SoonView.route),
    _Model(title: "To-Do List", icon: "to_do_list.svg", route: SoonView.route),
    _Model(title: "Discount Approvals", icon: "discount_approvals.svg", route: SoonView.route),
    _Model(title: "Settings", icon: "settings.svg", route: SoonView.route),
  ];

  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB1B1B1).withOpacity(.12),
            offset: const Offset(0, 8),
            blurRadius: 56,
          )
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Center(
            child: AppImage(
              "logo.svg",
              width: 74,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(top: 16, start: 8, end: 16, bottom: 16),
              child: Column(
                children: List.generate(
                  list.length,
                      (index) => Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 4),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        selectedItem = index;
                        setState(() {});

                        widget.navKey.currentState!.pushNamed(list[index].route, arguments: list[index].title);
                        if (!Responsive.isWeb(context)) {
                          widget.onChange(index, list[selectedItem].title);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                        decoration: BoxDecoration(
                          color: selectedItem == index ? Theme.of(context).primaryColor : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppImage(
                              list[index].icon,
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                              color: selectedItem == index ? Colors.white : const Color(0xff8A99AA),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                list[index].title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selectedItem == index ? Colors.white : const Color(0xff8A99AA),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Model {
  late String title, icon, route;

  _Model({required this.title, required this.icon, required this.route});
}
