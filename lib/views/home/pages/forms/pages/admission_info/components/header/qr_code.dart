part of '../../view.dart';

class _QRCode extends StatelessWidget {
  const _QRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
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
              builder: (context) => SimpleDialog(
                contentPadding: EdgeInsets.all(24),
                backgroundColor: Color(0xffEBEBEB),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(color: Color(0xffF9F9F9), borderRadius: BorderRadius.circular(8)),
                    child: Text("Scan QR Code (Admission ID)"),
                  ),
                  SizedBox(height: 24),
                  AppImage(
                    "https://cdn.britannica.com/17/155017-050-9AC96FC8/Example-QR-code.jpg",
                    height: 200,
                  )
                ],
              ),
            );
          },
          child: AppImage("qr_code.svg"),
        ),
      ],
    );
  }
}
