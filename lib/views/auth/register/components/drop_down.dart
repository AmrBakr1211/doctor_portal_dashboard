part of 'form.dart';

class _DropDown extends StatefulWidget {
  final List<String> list;
  final String title, hint;
  final bool isRequired;
  final String? Function(String?)? validator;
  final ValueChanged<int> onChoose;
  final bool isLoading;
  final int? selectedIndex;
  final double marginBottom;

  const _DropDown(
      {Key? key,
      required this.list,
      required this.title,
      required this.hint,
      required this.onChoose,
      required this.isRequired,
      this.validator,
      this.marginBottom = 16,
      this.isLoading = false,
      this.selectedIndex})
      : super(key: key);

  @override
  State<_DropDown> createState() => __DropDownState();
}

class __DropDownState extends State<_DropDown> {
  int? selectedDurationIndex;

  @override
  void initState() {
    super.initState();
    selectedDurationIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 12,
                height: 2,
                fontWeight: FontWeight.w500,
                color: Color(0xff414D55),
              ),
            ),
            const SizedBox(width: 4),
            if (widget.isRequired)
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
        FormField(
          builder: (field) => InputDecorator(
            decoration: InputDecoration(
              contentPadding: const EdgeInsetsDirectional.only(start: 16, top: 0, bottom: 8, end: 10),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
              isDense: true,
              fillColor: Colors.white,
              filled: true,
            ),
            child: DropdownButton<int>(
              value: selectedDurationIndex,
              elevation: 0,
              focusColor: Colors.transparent,
              padding: EdgeInsets.zero,
              iconSize: 16,
              icon: widget.isLoading
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: .9,
                      )))
                  : const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 24,
                      color: Color(0xffA2C0D4),
                    ),
              onChanged: (value) {
                print(value);
                if (value != null) {
                  selectedDurationIndex = value;
                  widget.onChoose(value);
                  setState(() {});
                }
              },
              underline: const SizedBox.shrink(),
              hint: Text(
                widget.hint,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff90A1AC)),
              ),
              borderRadius: BorderRadius.circular(5),
              isExpanded: true,
              items: List.generate(
                widget.list.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    widget.list[index].trim(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          validator: (value) {
            if (selectedDurationIndex == null && widget.isRequired) {
              return InputValidator.requiredValidator(
                value: selectedDurationIndex == null ? "" : selectedDurationIndex.toString(),
                itemName: widget.title,
              );
            }
            return null;
          },
        ),
        // SizedBox(height: widget.marginBottom),
      ],
    );
  }
}
