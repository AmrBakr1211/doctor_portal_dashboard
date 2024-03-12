part of '../view.dart';

class _Allergies extends StatelessWidget {
  const _Allergies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Toggle(
        title: "Allergies",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(),
            ),
          ],
        ));
  }
}
