part of '../view.dart';

class _VitalSigns2 extends StatefulWidget {
  const _VitalSigns2({Key? key}) : super(key: key);

  @override
  State<_VitalSigns2> createState() => _VitalSigns2State();
}

class _VitalSigns2State extends State<_VitalSigns2> {
  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "Blood Pressure",
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child:  Column(
              children: [
                _ItemVitalSign(title: "Right arm"),
                _ItemVitalSign(title: "Right leg"),
              ],
            ),
          ),
          Spacer(),
          IntrinsicWidth(
            child: Column(
              children: [
                _ItemVitalSign(title: "Left arm"),
                _ItemVitalSign(title: "Left leg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}