part of '../../view.dart';

class _QRCode extends StatelessWidget {
  const _QRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "ADMISSION Number # 23521336",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ScanQRDialog(),
            );
          },
          child: AppImage("qr_code.svg"),
        ),
      ],
    );
  }
}
