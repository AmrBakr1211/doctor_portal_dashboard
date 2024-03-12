import 'package:flutter/material.dart';

import '../../../core/design/app_image.dart';

class SearchBox extends StatefulWidget {
  final String hintText;
  final String? prefixIcon, suffixIcon;

  const SearchBox({Key? key, required this.hintText, this.prefixIcon, this.suffixIcon}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xffF5F6FF),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351,
      decoration:
      BoxDecoration(boxShadow: [BoxShadow(offset: const Offset(0, 7), blurRadius: 58, color: const Color(0xffB1B1B1).withOpacity(.1))]),
      child: TextFormField(
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              border: searchBorder,
              hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffBDC1DF)),
              enabledBorder: searchBorder,
              focusedBorder: searchBorder,
              prefixIcon: widget.prefixIcon != null ?  AppImage(widget.prefixIcon!) : null,
              suffixIcon: widget.suffixIcon!=null? const AppImage("search.svg"):null,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          hintText: widget.hintText),
    ),);
  }
}
