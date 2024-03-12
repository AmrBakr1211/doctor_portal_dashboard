part of 'form.dart';

class _Input extends StatelessWidget {
  final String label;
  final String hint;
  final bool isRequired;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const _Input({
    Key? key,
    this.label = "",
    this.hint = "",
    this.controller,
    this.isRequired = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                height: 2,
                fontWeight: FontWeight.w500,
                color: Color(0xff414D55),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            if (isRequired)
              const Text(
                "*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              )
          ],
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
          ),
        ),
      ],
    );
  }
}
