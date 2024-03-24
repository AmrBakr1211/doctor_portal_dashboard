import 'package:flutter/material.dart';

import 'pages/admission_info/view.dart';

class FormsPage extends StatefulWidget {
  static const route = "/home/forms";

  const FormsPage({Key? key}) : super(key: key);

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return const AdmissionInfoPage();
  }

}
