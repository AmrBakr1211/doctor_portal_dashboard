part of '../view.dart';

class _EmergencyContact extends StatefulWidget {
  const _EmergencyContact({Key? key}) : super(key: key);

  @override
  State<_EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<_EmergencyContact> {
  List<String> list = ["Ambulatory", "Non Ambulatory", "Ambulatory With Assist :"];

  int selectedIndex = 0;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return const _Toggle(
        title: "Emergency Contact",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Item(title: "Name :"),
            _Item(title: "Relationship :"),
            _Item(title: "Telephone No :"),
            _Item(title: "City :"),
          ],
        ));
  }

  // Widget shape1(){
  //   return SizedBox(
  //     height: 54,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Expanded(
  //           child: Container(
  //             alignment: AlignmentDirectional.centerStart,
  //             child: Text(
  //               "EmergencyContact",
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
  //         _Item(
  //           title: "Name :",
  //         ),
  //         SizedBox(width: 14),
  //         _Item(
  //           title: "Relationship :",
  //         ),
  //         SizedBox(width: 14),
  //         _Item(
  //           title: "Telephone No :",
  //         ),
  //         SizedBox(width: 14),
  //         _Item(
  //           title: "City :",
  //         ),
  //       ],
  //     ),
  //   );
  // }

}

class _Item extends StatelessWidget {
  final String title;

  const _Item({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: TextFormField(
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
// class _Item extends StatelessWidget {
//   final String title;
//
//   const _Item({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // SizedBox(height: 14,),
//           Text(title),
//           SizedBox(height: 8,),
//           Expanded(
//             child: TextFormField(
//               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
