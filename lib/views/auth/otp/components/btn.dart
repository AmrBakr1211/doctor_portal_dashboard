part of 'form.dart';

class _Btn extends StatelessWidget {
  final VoidCallback confirm;
  const _Btn({Key? key, required this.confirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: FilledButton.tonal(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Re-send"),
            )),
        const SizedBox(width: 8),
        Expanded(
            child: FilledButton(
              onPressed: confirm,
              child: const Text("Confirm"),
            )),
      ],
    );
  }
}
