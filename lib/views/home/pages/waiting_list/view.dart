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

// part 'components/body/tablet.dart';
//
// part 'components/body/web.dart';
//
// part 'components/body/body.dart';

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
      padding: const EdgeInsets.all(2),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _Header()),
          SliverToBoxAdapter(child: SizedBox(height: 2)),
          if (Responsive.isTablet(context))
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.h,
                mainAxisSpacing: 16.h,
                childAspectRatio: .82.h,
              ),
              itemBuilder: (context, index) => _Item(),
              itemCount: 10,
            ),
          if (!Responsive.isTablet(context))
            SliverPadding(
                padding: EdgeInsetsDirectional.only(top: 16, bottom: 16, end: 16, start: 8),
                sliver: SliverList.separated(
                  separatorBuilder: (context, index) => Responsive.isWeb(context)
                      ? Divider(
                          color: Color(0xffDCE2E8),
                        )
                      : SizedBox.shrink(),
                  itemBuilder: (context, index) => _Item(),
                  itemCount: 10,
                )),
          // SliverFillRemaining(child: _Body()),
        ],
      ),
    );
  }
}
