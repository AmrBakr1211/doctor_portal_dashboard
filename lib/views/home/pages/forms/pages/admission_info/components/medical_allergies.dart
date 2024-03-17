part of '../view.dart';

class _MedicalAllergies extends StatelessWidget {
  const _MedicalAllergies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: "",
      child: Column(
        children: [
          _ItemMedicalAllergies(title: "Medical/Route/Dose"),
          SizedBox(height: 32,),
          _ItemMedicalAllergies(title: "Allergies"),
        ],
      ),
    );
  }
}


class _ItemMedicalAllergies extends StatelessWidget {
  final String title;
  const _ItemMedicalAllergies({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff121212),
            ),
          ),
        ),
        FormInput(isMultiLine: true,hintText: "Add note here"),
      ],
    );
  }
}
