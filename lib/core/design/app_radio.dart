import 'package:flutter/material.dart';

class AppRadio extends StatelessWidget {
  final String title;
  final int index, selectedIndex;
  final double? marginBottom;
  final ValueChanged<int> onChange;

  const AppRadio({
    Key? key,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onChange, this.marginBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(index);
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: marginBottom??16),
        child: Row(
          children: [
            SizedBox(
              height: 14,
              width: 14,
              child: Radio(
                splashRadius: 0,
                value: index,
                groupValue: selectedIndex,
                onChanged: (v) {
                  onChange(index);
                },
              ),
            ),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: index == selectedIndex ? Theme.of(context).primaryColor : Color(0xff8A99AA),
              ),
            )
          ],
        ),
      ),
    );
  }
}
