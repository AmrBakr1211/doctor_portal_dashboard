import 'package:flutter/material.dart';


class DashBoardPage extends StatelessWidget {
  static const route = "/dashboard";

  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Dashboard"),);
  }
}
