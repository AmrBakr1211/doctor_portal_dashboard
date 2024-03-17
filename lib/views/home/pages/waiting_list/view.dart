import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/features/home/waiting_list/bloc.dart';
import 'package:app/views/home/pages/waiting_list/components/item/horizontal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../components/search_box.dart';
import 'components/item/grid.dart';

part 'components/header.dart';

part 'components/item/item.dart';

part 'platforms/mobile.dart';

part 'platforms/tablet.dart';

part 'platforms/web.dart';

class WaitingListPage extends StatefulWidget {
  static const route = "/waitingList";

  const WaitingListPage({Key? key}) : super(key: key);

  @override
  State<WaitingListPage> createState() => _WaitingListPageState();
}

class _WaitingListPageState extends State<WaitingListPage> {
  final bloc = KiwiContainer().resolve<GetWaitingListBloc>()
    ..add(
      GetWaitingListEvent(),
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          _Header(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffF5F6FF)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Responsive(
                mobile: _Mobile(),
                tablet: _Tablet(),
                web: _Web(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
