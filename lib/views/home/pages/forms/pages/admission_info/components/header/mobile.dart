part of '../../view.dart';

class _HeaderMobile extends StatelessWidget {
  const _HeaderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _QRCode(),
        SizedBox(height: 16),
        _ItemHeader(title: "File Number:", value: "12235441"),
        SizedBox(height: 8),
        _ItemHeader(title: "Patient Name:", value: "Mostafa Mahmoud Ismail"),
        SizedBox(height: 8),
        _ItemHeader(title: "Insurance:", value: "INS-001 Bupa Arabia"),
        SizedBox(height: 8),
        _ItemHeader(title: "Company:", value: "Abdulatif Jameel Hospital"),
        SizedBox(height: 8),
        _ItemHeader(title: "Diagnosis:", value: "03.0 Fever ,Cough "),
        SizedBox(height: 8),
        _ItemHeader(title: "Consultant:", value: "Dr. Hamdy Abdul Satar "),
        SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: () {},
          label: Text("View Data"),
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xffDEEEFF),
            foregroundColor: Color(0xff0496FF),
            fixedSize: Size.fromHeight(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          icon: AppImage(
            "view_data.svg",
            height: 16,
            width: 16,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
