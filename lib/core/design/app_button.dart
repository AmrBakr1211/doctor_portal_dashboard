import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback? onPress;

  const AppButton({super.key, this.isLoading = false, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: isLoading ? null : onPress,
      icon: isLoading
          ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : const SizedBox(),
      label: Text(text),
    );
  }
}
