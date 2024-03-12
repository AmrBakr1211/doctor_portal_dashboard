part of 'form.dart';

class _DateOfBirth extends StatefulWidget {
  final RegisterBloc bloc;

  const _DateOfBirth({Key? key, required this.bloc}) : super(key: key);

  @override
  State<_DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<_DateOfBirth> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showDatePicker(
            context: context,
            firstDate: DateTime(1950),
            initialDate: DateTime(2010),
            lastDate: DateTime(2010));
        if (result != null) {
          selectedDate = result;
          widget.bloc.dateController.text =
              DateFormat.yMd().format(selectedDate!);
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Date of birth",
                  style: TextStyle(
                    fontSize: 12,
                    height: 2,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff414D55),
                  ),
                ),
                SizedBox(width: 4),
                Text(
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
              controller: widget.bloc.dateController,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              decoration: const InputDecoration(
                hintText: "yyyy-MM-dd",
                enabled: false,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
