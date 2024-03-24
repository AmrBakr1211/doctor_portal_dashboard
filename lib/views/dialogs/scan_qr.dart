import 'package:flutter/material.dart';

import '../../core/design/app_image.dart';

class ScanQRDialog extends StatelessWidget {
  const ScanQRDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      children: [
        Row(
          children: [
            AppImage("scan_qr.svg"),
            SizedBox(width: 8),
            Text(
              "Scan QR Code (Admission ID)",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 32),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear),
            )
          ],
        ),
        SizedBox(height: 24),
        SizedBox(
          height: 240,
          width: 240,
          child: AppImage(
            "https://cdn.britannica.com/17/155017-050-9AC96FC8/Example-QR-code.jpg",
            height: 240,
            width: 240,
          ),
        )
      ],
    );
  }
}
