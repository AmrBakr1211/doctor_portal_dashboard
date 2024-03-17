part of '../view.dart';

class _OutSideData extends StatefulWidget {
  const _OutSideData({Key? key}) : super(key: key);

  @override
  State<_OutSideData> createState() => _OutSideDataState();
}

class _OutSideDataState extends State<_OutSideData> {
  int selectedIndex = 0;
  final list = ["Slides Disposition", "Film Disposition", "Reports Disposition", "None"];

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "Outside Data",
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
              if (index != list.length - 1 && selectedIndex == index)
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
