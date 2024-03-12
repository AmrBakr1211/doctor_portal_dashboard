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
    list = ["Appliance", widget.isBowel ? "Date Last BM" : "LMP", "Continent", "InContinent"];
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
              GestureDetector(
                onTap: () {
                  selectedDate = null;
                  choose(index);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                        value: selectedIndex,
                        groupValue: index,
                        toggleable: false,
                        visualDensity: VisualDensity.compact,
                        onChanged: (value) {
                          choose(index);
                        },
                      ),
                      Text(list[index])
                    ],
                  ),
                ),
              ),
              if (index == 0 && selectedIndex == index)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(),
                ),
              if (index == 1 && selectedIndex == index)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
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
                      child: TextFormField(
                        controller: TextEditingController(text: selectedDate),
                        decoration: const InputDecoration(suffixIcon: Icon(Icons.calendar_month)),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void choose(index) {
    selectedIndex = index;
    setState(() {});
  }
}
