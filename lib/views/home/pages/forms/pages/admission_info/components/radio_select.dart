part of '../view.dart';

class _RadioSelect extends StatefulWidget {
  final String title;
  final List<String> list;

  const _RadioSelect({Key? key, required this.title, required this.list}) : super(key: key);

  @override
  State<_RadioSelect> createState() => _RadioSelectState();
}

class _RadioSelectState extends State<_RadioSelect> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: widget.title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          widget.list.length,
              (index) => GestureDetector(
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
                  Text(widget.list[index])
                ],
              ),
            ),
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
