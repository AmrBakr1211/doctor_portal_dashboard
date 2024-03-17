import 'package:app/core/design/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatefulWidget {
  final double? marginBottom;
  final bool isOnlyNumber;
  final String? hintText;
  final String? suffixIcon;
  final bool isMultiLine;
  final TextEditingController? controller;

  const FormInput({
    Key? key,
    this.marginBottom,
    this.isOnlyNumber = false,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.isMultiLine = false,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xffF5F6FF),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom ?? 0),
      child: TextFormField(
        controller: widget.controller,
        minLines: widget.isMultiLine?3:null,
        maxLines: widget.isMultiLine?7:1,
        inputFormatters: [
          if (widget.isOnlyNumber) FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: border,
          suffixIcon: widget.suffixIcon != null
              ? AppImage(
                  widget.suffixIcon!,
                  color: Theme.of(context).primaryColor,
                )
              : null,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.all(12),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xff121212),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
