import 'package:flutter/material.dart';

import '../../../../core/design/app_image.dart';
import '../../../../core/logic/cache_helper.dart';

class TopNavBarMobile extends StatelessWidget {
  final String title;

  const TopNavBarMobile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          SizedBox(width: 16),
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: const AppImage(
              "notifications.svg",
              height: 20,
              width: 20,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 16),
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
                  height: 36,
                  width: 36,
                ),
              ))
        ],
      ),
    );
  }
}
