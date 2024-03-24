import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

enum InputType { normal, password, money }

class AppInput extends StatefulWidget {
  final InputType inputType;
  final String hint, label;
  final String? prefix;
  final Color? prefixColor;
  final bool isDense;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;

  const AppInput({
    super.key,
    this.hint = "",
    this.label = "",
    this.prefix,
    this.prefixColor,
    this.inputType = InputType.normal,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.validator,
    this.onChanged,
    this.isDense = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordShown = false;
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color(0xffF5F6FF),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              height: 2,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 9),
          TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            obscureText: (widget.inputType == InputType.password) && !isPasswordShown,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            validator: widget.validator,

            // textAlign: TextAlign.center,
            inputFormatters: [
              if ([InputType.money].contains(widget.inputType)) FilteringTextInputFormatter.allow(RegExp("^(?!0)[0-9\\s]*")),
            ],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffEDF4FF)),
            decoration: InputDecoration(
              hintText: widget.hint,
              focusedBorder: border,
              hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffEDF4FF)),
              border: border,
              enabledBorder: border,
              disabledBorder: border,
              isDense: widget.isDense,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 50,
                maxWidth: 50,
                minHeight: 30,
                maxHeight: 30
              ),
              prefixIcon: widget.prefix != null
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 8),
                          AppImage(
                            widget.prefix!,
                            color: widget.prefixColor,
                            height: 20,
                            width: 20,
                          ),
                          VerticalDivider(),
                        ],
                      ),
                    )
                  : null,
              suffixIcon: widget.inputType == InputType.password
                  ? GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        margin: EdgeInsetsDirectional.only(end: 3.w),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: AppImage(
                            "view_data.svg",
                            fit: BoxFit.fill,
                            color: isPasswordShown ? Theme.of(context).primaryColor : Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        isPasswordShown = !isPasswordShown;
                        setState(() {});
                      },
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
