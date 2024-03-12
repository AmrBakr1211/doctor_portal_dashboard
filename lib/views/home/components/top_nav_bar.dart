import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/app_loading.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/core/logic/cache_helper.dart';
import 'package:app/features/home/notifications/bloc.dart';

import '../pages/dashboard/view.dart';
import 'item_notifications.dart';
import 'search_box.dart';

class TopNavBar extends StatefulWidget {
  final String title;
  final GlobalKey<NavigatorState> navKey;

  const TopNavBar({Key? key, required this.title, required this.navKey}) : super(key: key);

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(32, 0),
            blurRadius: 56,
            color: const Color(0xffB1B1B1).withOpacity(.12),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 29),
      child: Row(
        children: [
          if (!Responsive.isWeb(context))
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu)),
                ),
                Text(
                  widget.title,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          if (Responsive.isWeb(context))
            const SearchBox(suffixIcon: "search.svg",hintText: "Search here"),
          const Spacer(),
          if (!Responsive.isMobile(context))
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff121212).withOpacity(.04),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const AppImage(
                            "notifications.svg",
                            height: 20,
                            width: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xffFF445B),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const VerticalDivider(color: Color(0xffF5F4F4)),
                  const SizedBox(width: 12),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffE9F2FF),
                        ),
                      ),
                      child: ClipOval(
                        child: AppImage(
                          CacheHelper.image,
                          fit: BoxFit.fill,
                          // failedImageType: CacheHelper.isMale ? FailedImageType.patientMale : FailedImageType.patientFemale,
                          height: 40,
                          width: 40,
                        ),
                      )),
                  const SizedBox(width: 8),
                  Text(
                    CacheHelper.profileName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff414D55),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const AppImage("arrow_down.svg"),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showMenu(context, List<MyNotificationModel> list) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final left = offset.dx;
    final top = offset.dy + renderBox.size.height;
    final right = left + renderBox.size.width;
    await showMenu(
      context: context,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      position: RelativeRect.fromDirectional(
        textDirection: TextDirection.ltr,
        start: 1,
        top: top + 8,
        end: 0,
        bottom: 0,
      ),
      // position: RelativeRect.fromLTRB(left, top, right, 0),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width / 2,
        maxWidth: MediaQuery.of(context).size.width / 2,
        minHeight: 150.h,
        maxHeight: MediaQuery.of(context).size.height * .70,
      ),
      items: list.isEmpty
          ? [
              PopupMenuItem(
                onTap: () {},
                value: 0,
                child: const Center(
                  child: Text("No Notifications"),
                ),
              )
            ]
          : List.generate(
              list.length,
              (index) => PopupMenuItem(
                onTap: () {},
                value: index,
                child: ItemNotification(model: list[index]),
              ),
            ),
    );
  }
}
