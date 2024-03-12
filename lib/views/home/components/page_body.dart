import 'package:flutter/material.dart';

import '../../../core/design/responsive.dart';

class PageBody extends StatelessWidget {
  final String title;
  final Widget child;
  final bool withBg;

  const PageBody({Key? key, required this.title, required this.child, this.withBg = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          if (Responsive.isWeb(context))
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xff414D55)),
              ),
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: withBg?BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 8,
                    color: const Color(0xff142E6E).withOpacity(.1),
                  )
                ],
                color: Colors.white,
              ):null,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
