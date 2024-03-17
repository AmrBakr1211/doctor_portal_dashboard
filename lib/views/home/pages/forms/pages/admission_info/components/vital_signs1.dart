part of '../view.dart';

class _VitalSigns1 extends StatefulWidget {
  const _VitalSigns1({Key? key}) : super(key: key);

  @override
  State<_VitalSigns1> createState() => _VitalSigns1State();
}

class _VitalSigns1State extends State<_VitalSigns1> {
  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "Vital Signs",
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child:  Column(
              children: [
                _ItemVitalSign(title: "Brachial Pulse"),
                _ItemVitalSign(title: "Apical Pulse"),
                _ItemVitalSign(title: "Head Circ"),
                _ItemVitalSign(title: "Cuff Size"),
                _ItemVitalSign(title: "Pulse"),
              ],
            ),
          ),
          Spacer(),
          IntrinsicWidth(
            child: Column(
              children: [
                _ItemVitalSign(title: "Temp"),
                _ItemVitalSign(title: "R Resp"),
                _ItemVitalSign(title: "FTH"),
                _ItemVitalSign(title: "Spo2"),
                _ItemVitalSign(title: "Scale"),
                _ItemVitalSign(title: "GCS"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemVitalSign extends StatefulWidget {
  final String title;

  const _ItemVitalSign({Key? key, required this.title}) : super(key: key);

  @override
  State<_ItemVitalSign> createState() => _ItemVitalSignState();
}

class _ItemVitalSignState extends State<_ItemVitalSign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff8A99AA),
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            width: 60,
            height: 34,
            child: FormInput(),
          ),
        ],
      ),
    );
  }
}
