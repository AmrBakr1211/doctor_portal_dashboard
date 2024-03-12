part of 'form.dart';

class _PinCode extends StatefulWidget {
  final onComplete;

  const _PinCode({Key? key, this.onComplete}) : super(key: key);

  @override
  __PinCodeState createState() => __PinCodeState();
}

class __PinCodeState extends State<_PinCode> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();

  String get code {
    return pin1Controller.text +
        pin2Controller.text +
        pin3Controller.text +
        pin4Controller.text;
  }

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
    widget.onComplete(code);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: TextFormField(
              autofocus: true,
              controller: pin1Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.allow(RegExp("[0-9]*")),
              ],
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin2FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: TextFormField(
              focusNode: pin2FocusNode,
              controller: pin2Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.allow(RegExp("[0-9]*")),
              ],
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: TextFormField(
              focusNode: pin3FocusNode,
              controller: pin3Controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.allow(RegExp("[0-9]*")),
              ],
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin4FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: TextFormField(
              focusNode: pin4FocusNode,
              controller: pin4Controller,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.allow(RegExp("[0-9]*")),
              ],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: otpInputDecoration,
              onChanged: (value) {
                if (value.length == 1) {
                  pin4FocusNode!.unfocus();
                }
                widget.onComplete(code);
              },
            ),
          ),
        ],
      ),
    );
  }
}

const kTextColor = Colors.black;

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  filled: true,
  fillColor: Colors.white,
  border: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  enabledBorder: outlineInputBorder,
);

OutlineInputBorder get outlineInputBorder {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}
