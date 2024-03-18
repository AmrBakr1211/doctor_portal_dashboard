part of '../../view.dart';

class _HeaderWeb extends StatelessWidget {
  const _HeaderWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _QRCode(),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ItemHeader(title: "File Number:", value: "12235441")),
                      SizedBox(width: 8),
                      Expanded(child: _ItemHeader(title: "Insurance:", value: "INS-001 Bupa Arabia")),
                      SizedBox(width: 8),
                      Expanded(child: _ItemHeader(title: "Consultant:", value: "Dr. Hamdy Abdul Satar ")),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ItemHeader(title: "Patient Name:", value: "Mostafa Mahmoud Ismail")),
                      SizedBox(width: 8),
                      Expanded(child: _ItemHeader(title: "Company:", value: "Abdulatif Jameel Hospital")),
                      SizedBox(width: 8),
                      Expanded(child: _ItemHeader(title: "Diagnosis:", value: "03.0 Fever ,Cough ")),
                    ],
                  ),
                ],
              ),
            ),
            FilledButton.tonalIcon(
              onPressed: () {},
              label: Text("View Data"),
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xffDEEEFF),
                foregroundColor: Color(0xff0496FF),
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
        ),
      ],
    );
  }
}
