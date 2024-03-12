part of '../view.dart';

class _Prosthesis extends StatefulWidget {
  const _Prosthesis({Key? key}) : super(key: key);

  @override
  State<_Prosthesis> createState() => _ProsthesisState();
}

class _ProsthesisState extends State<_Prosthesis> {
  int selectedIndex = 0;
  final list = ["Glasses", "hearing Aid", "Upper Denture", "Lower Denture ", "Other","None"];

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
              if (index == list.length - 2 && selectedIndex == index)
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
