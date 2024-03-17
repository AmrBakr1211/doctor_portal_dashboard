part of '../view.dart';

class _RadioSelect extends StatefulWidget {
  final String title;
  final double? titleGap;
  final List<String> list;

  const _RadioSelect({Key? key, required this.title, required this.list, this.titleGap}) : super(key: key);

  @override
  State<_RadioSelect> createState() => _RadioSelectState();
}

class _RadioSelectState extends State<_RadioSelect> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff121212),
          ),
        ),
        SizedBox(height: widget.titleGap??20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            widget.list.length,
            (index) => Padding(
              padding:  EdgeInsetsDirectional.only(end: 32),
              child: AppRadio(
                title: widget.list[index],
                index: index,
                selectedIndex: selectedIndex,
                onChange: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
