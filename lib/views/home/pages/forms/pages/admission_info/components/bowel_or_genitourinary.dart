part of '../view.dart';

class _BowelOrGenitourinary extends StatefulWidget {
  final bool isBowel;

  const _BowelOrGenitourinary({Key? key, required this.isBowel}) : super(key: key);

  @override
  State<_BowelOrGenitourinary> createState() => _BowelOrGenitourinaryState();
}

class _BowelOrGenitourinaryState extends State<_BowelOrGenitourinary> {
  int selectedIndex = 0;
  late List<String> list;

  @override
  void initState() {
    super.initState();
    list = [
      "Continent",
      "InContinent",
      widget.isBowel ? "Date Last BM" : "LMP",
      "Appliance",
    ];
  }

  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return _Toggle(
      title: widget.isBowel ? "Bowel" : "Genitourinary",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          list.length,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppRadio(
                title: list[index],
                index: index,
                selectedIndex: selectedIndex,
                onChange: (value) {
                  selectedDate = null;
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              if (index == 3 && selectedIndex == index)
                FormInput(
                  marginBottom: 24,
                  hintText: "Add note here",
                ),
              if (index == 2 && selectedIndex == index)
                GestureDetector(
                  onTap: () async {
                    final result = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(
                          days: 365,
                        ),
                      ),
                    );
                    if (result != null) {
                      selectedDate = DateFormat.yMd().format(result);
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    child: FormInput(
                      controller: TextEditingController(text: selectedDate),
                      marginBottom: 24,
                      suffixIcon: "calender.svg",
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
