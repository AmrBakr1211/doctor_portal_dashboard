import 'package:flutter/material.dart';

import '../../../../../../core/design/app_image.dart';

class ItemWaitingListHorizontal extends StatelessWidget {
  const ItemWaitingListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 12,
                child: ClipOval(
                  child: AppImage(
                    "",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "151",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(width: 8),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ClipOval(
              child: AppImage(
                "",
                height: 56,
                width: 56,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                "8 Y",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff121212),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
            )
          ],
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "182944-JUMANAH SAMI ABSD ALHARTHI",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff121212),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "جمانه سامي عابد الحارثي",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8A99AA),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "discounted cash companies - ministry of health",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8A99AA),
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AppImage("timer.svg"),
                SizedBox(width: 2),
                Text(
                  "22 MIN",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff121212)),
                ),
                SizedBox(width: 8),
                AppImage("flash.svg"),
                SizedBox(width: 2),
                Text(
                  "17:55",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff121212)),
                ),
                SizedBox(width: 8),
                AppImage("clock.svg"),
                SizedBox(width: 2),
                Text(
                  "05/01/2024-22:30",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff121212)),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            AppImage("waiting_list_icon1.svg"),
            SizedBox(width: 4),
            AppImage("waiting_list_icon2.svg"),
            SizedBox(width: 4),
            AppImage("waiting_list_icon3.svg"),
            SizedBox(width: 4),
            AppImage("waiting_list_icon4.svg"),
            SizedBox(width: 4),
            AppImage("waiting_list_icon5.svg"),
            SizedBox(width: 4),
            AppImage("waiting_list_icon6.svg"),
          ],
        ),
        Spacer(),
        AppImage("waiting_list_icon7.svg"),
      ],
    );
  }
}
