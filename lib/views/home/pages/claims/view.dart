import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/responsive.dart';
import 'package:app/core/logic/cache_helper.dart';
import 'package:app/views/home/components/page_body.dart';


class ClaimsPage extends StatelessWidget {
  static const route = "/claims";

  const ClaimsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Claims"),);
  }
}
