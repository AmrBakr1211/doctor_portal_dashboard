import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/core/logic/cache_helper.dart';
import 'package:flutter/material.dart';

import '../search_box.dart';

class TopNavBarWeb extends StatelessWidget {
  final String title;

  const TopNavBarWeb({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
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
      child: Row(
        children: [
          const SearchBox(suffixIcon: "search.svg", hintText: "Search here"),
          const Spacer(),
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
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
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
}
