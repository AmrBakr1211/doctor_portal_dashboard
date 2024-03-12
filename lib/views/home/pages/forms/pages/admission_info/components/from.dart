part of '../view.dart';

class _From extends StatefulWidget {
  const _From({Key? key}) : super(key: key);

  @override
  State<_From> createState() => _FromState();
}

class _FromState extends State<_From> {
  List<String> list = ["Home", "Other Facility :", "Other :", "Transported By : "];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return shape2();
  }

  Widget shape2() {
    return _Toggle(title: "Form",child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        list.length,
            (index) => IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              if (index != 0)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
            ],
          ),
        ),
      ),
    ));
  }

  // Widget shape1() {
  //   return SizedBox(
  //     height: 54,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Expanded(
  //           child: Container(
  //             alignment: AlignmentDirectional.centerStart,
  //             child: Text(
  //               "From",
  //               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff717171)),
  //             ),
  //             padding: EdgeInsetsDirectional.only(start: 12),
  //             decoration: BoxDecoration(
  //               color: Color(0xffFAFBFD),
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //           ),
  //         ),
  //         SizedBox(width: 6),
  //         ...List.generate(
  //           list.length,
  //           (index) => Expanded(
  //             child: Padding(
  //               padding: EdgeInsetsDirectional.only(end: 14),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       choose(index);
  //                     },
  //                     child: Container(
  //                       color: Colors.transparent,
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Radio(
  //                             value: selectedIndex,
  //                             groupValue: index,
  //                             visualDensity: VisualDensity.compact,
  //                             onChanged: (value) {
  //                               choose(index);
  //                             },
  //                           ),
  //                           Text(list[index])
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   index != 0
  //                       ? Expanded(
  //                           child: TextFormField(
  //                           style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  //                         ))
  //                       : Expanded(
  //                           child: SizedBox(
  //                             height: 40,
  //                           ),
  //                         ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  void choose(index) {
    selectedIndex = index;
    setState(() {});
  }
}
