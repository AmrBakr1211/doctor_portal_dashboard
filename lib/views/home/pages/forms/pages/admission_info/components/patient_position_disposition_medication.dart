part of '../view.dart';

class _PatientPositionDispositionMedication extends StatelessWidget {
  const  _PatientPositionDispositionMedication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "",
      child: Column(
        children: [
          _RadioSelect(title: "Patient Position", list: ["Standard", "Sitting", "Lying"]),
          SizedBox(height: 40),
          _RadioSelect(title: "Disposition", list: ["Pharmacy","Home"]),
          SizedBox(height: 40),
          _RadioSelect(title: "Medication", list: ["None", "Yes"])
        ],
      ),
    );
  }
}
