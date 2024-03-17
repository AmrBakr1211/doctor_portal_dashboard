part of '../view.dart';

class _Prosthesis extends StatefulWidget {
  const _Prosthesis({Key? key}) : super(key: key);

  @override
  State<_Prosthesis> createState() => _ProsthesisState();
}

class _ProsthesisState extends State<_Prosthesis> {
  int selectedIndex = 0;
  final list = ["Glasses", "Hearing Aid", "Upper Denture", "Lower Denture", "None", "Other"];

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "Prosthesis",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          list.length,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppRadio(
                title: list[index],
                index: index,
                selectedIndex: selectedIndex,
                onChange: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
              ),
              if (index == list.length - 1 && selectedIndex == index)
                FormInput(
                  marginBottom: 24,
                  hintText: "Add note here",
                )
            ],
          ),
        ),
      ),
    );
  }
}
