import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      color: Colors.black,
      child: FittedBox(
        child: Wrap(
          runSpacing: 4,
          spacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Text(
              "Copyrights",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white, decoration: TextDecoration.none),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.copyright,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              "2024 DataOcean - Najia Abdulatif Jameel Group",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white, decoration: TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
