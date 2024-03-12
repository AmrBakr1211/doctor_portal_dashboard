import 'package:flutter/material.dart';

import 'app_image.dart';

class AppEmpty extends StatelessWidget {
  final String? image;
  final String? title;
  final double height, width, radius;

  const AppEmpty(
      {super.key,
       this.image,
       this.title,
      this.height = 250,
      this.width = 250,
      this.radius = 16});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: .42,
            child: AppImage(
              image??"no_data.svg",
              height: height,
              width: width,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title??"No Data",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff090909),
            ),
          ),
        ],
      ),
    );
  }
}
