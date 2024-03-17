part of '../view.dart';

class _Valuables extends StatefulWidget {
  const _Valuables({Key? key}) : super(key: key);

  @override
  State<_Valuables> createState() => _ValuablesState();
}

class _ValuablesState extends State<_Valuables> {
  int selectedIndex = 0;
  final list = ["Yes Description", "No Disposition"];

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "Valuables",
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
              if ( selectedIndex == index)
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
