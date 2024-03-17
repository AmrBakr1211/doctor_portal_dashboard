part of '../view.dart';

class _Tablet extends StatelessWidget {
  const _Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: .5,
      ),
      itemBuilder: (context, index) => _Item(),
      itemCount: 10,
    );
  }
}
