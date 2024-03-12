import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/core/logic/cache_helper.dart';
import 'package:app/views/home/components/page_body.dart';

import '../../components/search_box.dart';

part 'components/header.dart';

part 'components/item.dart';

class WaitingListPage extends StatelessWidget {
  static const route = "/waitingList";

  const WaitingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _Header(),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffF5F6FF)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: List.generate(10, (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Item(),
                    SizedBox(height: 16),
                    Divider(color: Color(0xffDCE2E8),height: 0,),
                    SizedBox(height: 16),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
