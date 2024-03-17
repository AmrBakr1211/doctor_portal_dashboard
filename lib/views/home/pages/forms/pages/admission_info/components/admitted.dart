part of '../view.dart';

class _Admitted extends StatefulWidget {
  const _Admitted({Key? key}) : super(key: key);

  @override
  State<_Admitted> createState() => _AdmittedState();
}

class _AdmittedState extends State<_Admitted> {
  List<String> list = ["Ambulatory", "Non Ambulatory", "Ambulatory With Assist :"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _Toggle(
        title: "Admitted",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            list.length,
            (index) => Column(
              mainAxisSize: MainAxisSize.min,
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
                if (index == list.length - 1 && selectedIndex == index) FormInput(),
              ],
            ),
          ),
        ));
  }
}
