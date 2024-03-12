import 'package:flutter/material.dart';
import '../../../../routes.dart';
import 'pages/admission_info/view.dart';

class FormsPage extends StatefulWidget {
  static const route = "/forms";

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