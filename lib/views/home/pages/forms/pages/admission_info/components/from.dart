part of '../view.dart';

class _From extends StatefulWidget {
  const _From({Key? key}) : super(key: key);

  @override
  State<_From> createState() => _FromState();
}

class _FromState extends State<_From> {
  List<String> list = ["Home", "Other Facility", "Other", "Transported By "];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _Toggle(
        title: "Form",
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
                  marginBottom: index != 0?8:null,
                  selectedIndex: selectedIndex,
                  onChange: (value) {
                    selectedIndex = value;
                    setState(() {});
                  },
                ),
                if (index != 0) FormInput(marginBottom: 24),
              ],
            ),
          ),
        ));
  }
}
