part of '../view.dart';

class _VitalSigns extends StatefulWidget {
  const _VitalSigns({Key? key}) : super(key: key);

  @override
  State<_VitalSigns> createState() => _VitalSignsState();
}

class _VitalSignsState extends State<_VitalSigns> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return shape2();
  }

  Widget shape2() {
    return const _Toggle(
        title: "Vital Signs",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _ItemVitalSign(title: "Temp"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "R Resp"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "FTH"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _ItemVitalSign(title: "Brachial Pulse"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "Apical Pulse"),
              ],
            ),
            Row(
              children: [
                _ItemVitalSign(title: "Spo2"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "Scale"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "Head Circ"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _ItemVitalSign(title: "GCS"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "Pulse"),
                SizedBox(width: 6),
                _ItemVitalSign(title: "Cuff Size"),
              ],
            ),
            // SizedBox(height: 8),
          ],
        ));
  }
}

class _ItemVitalSign extends StatelessWidget {
  final String title;

  const _ItemVitalSign({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xff717171)),
          ),
          const SizedBox(width: 4),
          TextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 2),
            ),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

// Widget shape1(){
//   return SizedBox(
//     height: 54,
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           child: Container(
//             height: 54,
//             alignment: AlignmentDirectional.centerStart,
//             child: Text(
//               "Vital Signs",
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
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _ItemVitalSign(title: "Temp"),
//                   SizedBox(width: 6),
//                   _ItemVitalSign(title: "R Resp"),
//                   SizedBox(width: 6),
//                   _ItemVitalSign(title: "FTH"),
//                 ],
//               ),
//               SizedBox(height: 6),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _ItemVitalSign(title: "Brachial Pulse"),
//                   SizedBox(width: 2),
//                   _ItemVitalSign(title: "Apical Pulse"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 14),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _ItemVitalSign(title: "Spo2"),
//                   SizedBox(width: 6),
//                   _ItemVitalSign(title: "Scale"),
//                   SizedBox(width: 6),
//                   _ItemVitalSign(title: "Head Circ"),
//                 ],
//               ),
//               SizedBox(height: 6),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _ItemVitalSign(title: "GCS"),
//                   SizedBox(width: 6),
//                   _ItemVitalSign(title: "Pulse"),
//                   SizedBox(width: 6),
//                   _ItemVitalSign(title: "Cuff Size"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 14),
//         // Expanded(
//         //   child: Column(
//         //     crossAxisAlignment: CrossAxisAlignment.start,
//         //     children: [
//         //       Row(
//         //         mainAxisSize: MainAxisSize.min,
//         //         children: [
//         //           _ItemVitalSign(title: "Temp"),
//         //           SizedBox(width: 6),
//         //           _ItemVitalSign(title: "R Resp"),
//         //           SizedBox(width: 6),
//         //           _ItemVitalSign(title: "FTH"),
//         //         ],
//         //       ),
//         //       SizedBox(height: 6),
//         //       Row(
//         //         mainAxisSize: MainAxisSize.min,
//         //         children: [
//         //           _ItemVitalSign(title: "Brachial Pulse"),
//         //           SizedBox(width: 6),
//         //           _ItemVitalSign(title: "Apical Pulse"),
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 6),
//             decoration: BoxDecoration(
//                 border: Border.all()
//             ),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _ItemVitalSign(title: "Right arm"),
//                       SizedBox(width: 30),
//                       _ItemVitalSign(title: "Left arm"),
//                     ],
//                   ),
//                   SizedBox(height: 2),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       _ItemVitalSign(title: "Right leg"),
//                       SizedBox(width: 30),
//                       _ItemVitalSign(title: "Left leg"),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 14),
//         Spacer(),
//       ],
//     ),
//   );
// }
// class _ItemVitalSign extends StatelessWidget {
//   final String title;
//
//   const _ItemVitalSign({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: FittedBox(
//               fit: BoxFit.scaleDown,
//               child: Text(title,style: TextStyle(
//                 color: Color(0xff717171)
//               ),),
//             ),
//           ),
//           SizedBox(width: 4),
//           SizedBox(
//             height: 22,
//             width: 30,
//             child: TextFormField(
//               inputFormatters: [
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 2),
//               ),
//               style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
