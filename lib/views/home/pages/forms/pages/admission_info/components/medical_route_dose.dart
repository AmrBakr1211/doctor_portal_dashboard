part of '../view.dart';

class _MedicalRouteDose extends StatelessWidget {
  const _MedicalRouteDose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Toggle(
        title: "Medical/Route/Dose",
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
