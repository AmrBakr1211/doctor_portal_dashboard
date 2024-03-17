part of '../../view.dart';

class _Item extends StatefulWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ItemWaitingListGrid(),
      tablet: ItemWaitingListGrid(),
      web: ItemWaitingListHorizontal(),
    );
  }
}
