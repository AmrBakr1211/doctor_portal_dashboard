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
              if (index != list.length - 1 && selectedIndex == index)
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
