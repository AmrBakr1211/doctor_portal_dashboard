part of '../view.dart';

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      itemBuilder: (context, index) => _Item(),
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemCount: 10,
    );
  }
}
