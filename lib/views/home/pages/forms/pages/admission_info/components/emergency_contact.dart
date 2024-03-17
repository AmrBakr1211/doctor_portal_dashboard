part of '../view.dart';

class _EmergencyContact extends StatefulWidget {
  const _EmergencyContact({Key? key}) : super(key: key);

  @override
  State<_EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<_EmergencyContact> {
  List<String> list = ["Ambulatory", "Non Ambulatory", "Ambulatory With Assist :"];

  @override
  Widget build(BuildContext context) {
    return const _Toggle(
        title: "Emergency Contact",
        child: Column(
          children: [
            _Item(title: "Name:"),
            _Item(title: "Relationship:"),
            _Item(title: "Telephone No:"),
            _Item(title: "City:"),
          ],
        ));
  }
}

class _Item extends StatefulWidget {
  final String title;

  const _Item({Key? key, required this.title}) : super(key: key);

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff8A99AA),
          ),
        ),
        const SizedBox(height: 4),
        FormInput(
          marginBottom: 24,
        ),
      ],
    );
  }
}
