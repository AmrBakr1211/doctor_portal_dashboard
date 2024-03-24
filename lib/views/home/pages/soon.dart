import 'package:flutter/material.dart';


class SoonView extends StatelessWidget {
  static const route = "/home/soon";
  final String title;
  const SoonView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Soon",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor
      ),),
    );
  }
}
