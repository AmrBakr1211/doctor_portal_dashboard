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
              if ( selectedIndex == index)
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
