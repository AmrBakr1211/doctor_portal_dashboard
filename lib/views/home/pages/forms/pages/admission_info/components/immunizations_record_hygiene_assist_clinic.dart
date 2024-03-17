part of '../view.dart';

class _ImmunizationsRecordHygieneAssistClinic extends StatelessWidget {
  const _ImmunizationsRecordHygieneAssistClinic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "",
      child: Column(
        children: [
          _RadioSelect(
            title: "Immunizations",
            titleGap: 12,
            list: ["Yes", "No", "Unknown"],
          ),
          _RadioSelect(
            title: "Record",
            titleGap: 12,
            list: ["Yes", "No"],
          ),
          _RadioSelect(
            title: "Hygiene",
            titleGap: 12,
            list: ["Hygiene", "Poor (Requires Technician )"],
          ),
          _RadioSelect(
            title: "Assist",
            titleGap: 12,
            list: ["Yes", "No"],
          ),
          _RadioSelect(
            title: "Clinic Appt",
            titleGap: 12,
            list: ["Yes", "No", "Clinic Contracted"],
          ),
        ],
      ),
    );
  }
}
