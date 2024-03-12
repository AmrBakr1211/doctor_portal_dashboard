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
              GestureDetector(
                onTap: () {
                  choose(index);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        value: selectedIndex,
                        groupValue: index,
                        toggleable: false,
                        visualDensity: VisualDensity.compact,
                        onChanged: (value) {
                          choose(index);
                        },
                      ),
                      Text(list[index])
                    ],
                  ),
                ),
              ),
              if (index == list.length - 1 && selectedIndex == index)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(),
                )
            ],
          ),
        ),
      ),
    );
  }

  void choose(index) {
    selectedIndex = index;
    setState(() {});
  }
}
