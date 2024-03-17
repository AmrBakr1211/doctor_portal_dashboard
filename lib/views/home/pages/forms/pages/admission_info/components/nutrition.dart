part of '../view.dart';

class _Nutrition extends StatefulWidget {
  const _Nutrition({Key? key}) : super(key: key);

  @override
  State<_Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<_Nutrition> {
  int selectedIndex = 0;
  final list = ["Breast", "Gastrostomy", "Formula", "Nasogastric", "Diet, Specify"];

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "Nutrition",
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
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              if (index == list.length - 1 && selectedIndex == index)
                FormInput(
                  hintText: "Add note here",
                )
            ],
          ),
        ),
      ),
    );
  }
}
