// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class AppDropDown extends StatefulWidget {
//   final List<String> list;
//   final String title, hint;
//   final onChoose;
//   final bool isLoading;
//
//   const AppDropDown(
//       {Key? key,
//       required this.list,
//       required this.title,
//       required this.hint,
//       required this.onChoose,
//       this.isLoading = false})
//       : super(key: key);
//
//   @override
//   State<AppDropDown> createState() => _AppDropDownState();
// }
//
// class _AppDropDownState extends State<AppDropDown> {
//   int? selectedDurationIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: const Color(0xff414D55),
//           ),
//         ),
//         SizedBox(height: 5),
//         InputDecorator(
//           decoration: InputDecoration(
//             contentPadding: EdgeInsetsDirectional.only(
//                 start: 16, top: 13, bottom: 13, end: 10),
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(5),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(5),
//             ),
//             isDense: true,
//             fillColor: Colors.white,
//             filled: true,
//           ),
//           child: DropdownButton<int>(
//             value: selectedDurationIndex,
//             iconSize: 16,
//             icon: widget.isLoading
//                 ? SizedBox(
//                     height: 16,
//                     width: 16,
//                     child: Center(
//                         child: CircularProgressIndicator(
//                       strokeWidth: .9,
//                     )))
//                 : Icon(
//                     Icons.keyboard_arrow_down_sharp,
//                     size: 24,
//                     color: Color(0xffA2C0D4),
//                   ),
//             onChanged: (value) {
//               print(value);
//               selectedDurationIndex = value;
//               widget.onChoose(selectedDurationIndex);
//               setState(() {});
//             },
//             underline: const SizedBox(),
//             isDense: true,
//             hint: Text(
//               widget.hint,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xff90A1AC)),
//             ),
//             borderRadius: BorderRadius.circular(5),
//             isExpanded: true,
//             items: List.generate(
//               widget.list.length,
//               (index) => DropdownMenuItem(
//                 value: index,
//                 child: Text(widget.list[index]),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class AppDropDownDropDown extends StatefulWidget {
  final ValueChanged<int> onChange;
  final List<String> list;
  final int? initialIndex;

  const AppDropDownDropDown({Key? key, required this.onChange, required this.list, this.initialIndex}) : super(key: key);

  @override
  State<AppDropDownDropDown> createState() => _AppDropDownDropDownState();
}

class _AppDropDownDropDownState extends State<AppDropDownDropDown> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != null) {
      selectedIndex = widget.initialIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: IntrinsicWidth(
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: const EdgeInsetsDirectional.only(start: 16, top: 0, bottom: 8, end: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            isDense: true,
            fillColor: Colors.white,
            filled: true,
          ),
          child: DropdownButton<int>(
            value: selectedIndex,
            elevation: 0,
            focusColor: Colors.transparent,
            padding: EdgeInsets.zero,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff414D55)),
            iconSize: 16,
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 24,
              color: Color(0xff414D55),
            ),
            onChanged: (value) {
              print(value);
              if (value != null && value != selectedIndex) {
                selectedIndex = value;
                widget.onChange(value);
                setState(() {});
              }
            },
            underline: const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(5),
            enableFeedback: false,
            isExpanded: false,
            items: List.generate(
              widget.list.length,
              (index) => DropdownMenuItem(
                value: index,
                child: Text(
                  widget.list[index],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
