import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/design/responsive.dart';

class PickDateSheet extends StatefulWidget {
  final onConfirm;
  final List<DateTime?>? initialDates;
  final int? selectedItem;

  const PickDateSheet(
      {Key? key, required this.onConfirm, this.initialDates, this.selectedItem})
      : super(key: key);

  @override
  State<PickDateSheet> createState() => _PickDateSheetState();
}

class _PickDateSheetState extends State<PickDateSheet> {
  final list = [
    "Last 3 Days",
    "Last week",
    "Last Month",
    "Last Year",
  ];
  List<DateTime?>? _dates;

  int? selectedItem;

  @override
  void initState() {
    super.initState();
    _dates = widget.initialDates;
    selectedItem = widget.selectedItem;
  }

  void fillList() {
    if (selectedItem == 0) {
      _dates = [
        DateTime.now().subtract(const Duration(days: 2)),
        DateTime.now(),
      ];
      print(_dates!.length);
    } else if (selectedItem == 1) {
      _dates = [
        DateTime.now().subtract(const Duration(days: 6)),
        DateTime.now(),
      ];
      print(_dates!.length);
    } else if (selectedItem == 2) {
      _dates = [
        DateTime.now().subtract(const Duration(days: 29)),
        DateTime.now(),
      ];
    } else if (selectedItem == 3) {
      _dates = [
        DateTime.now().subtract(const Duration(days: 364)),
        DateTime.now(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(Responsive.isWeb(context) ? 16 : 8),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(Responsive.isWeb(context) ? 16 : 9)),
      insetPadding: EdgeInsets.all(Responsive.isWeb(context) ? 16 : 6),
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              "Choose",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: List.generate(
            list.length,
            (index) => InputChip(
              side: BorderSide.none,
              selected: selectedItem == index,
              surfaceTintColor: Colors.white,
              selectedShadowColor: Colors.white,
              selectedColor: Theme.of(context).primaryColor.withOpacity(.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide.none),
              onPressed: () {
                _dates?.clear();
                if (selectedItem == index) {
                  selectedItem = null;
                  _dates?.clear();
                } else {
                  selectedItem = index;
                  fillList();
                }
                setState(() {});
              },
              label: Text(
                list[index],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Or Pick Range",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          width: 300.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
          ),
          child: CalendarDatePicker2(
            displayedMonthDate: DateTime.now(),
            config: CalendarDatePicker2WithActionButtonsConfig(
              firstDayOfWeek: 0,
              okButton: const SizedBox.shrink(),
              cancelButton: const SizedBox.shrink(),
              calendarType: CalendarDatePicker2Type.range,
              selectedDayTextStyle:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              selectedDayHighlightColor: Theme.of(context).primaryColor,
              customModePickerIcon: const SizedBox(),
              buttonPadding: EdgeInsets.zero,
              gapBetweenCalendarAndButtons: 0,
            ),
            value: _dates ?? [],
            onValueChanged: (dates) {
              _dates = dates;
              selectedItem = null;
              setState(() {});
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {
                    if (selectedItem != null && _dates != null) {
                      selectedItem = null;
                      _dates?.clear();
                      widget.onConfirm(_dates, selectedItem);
                    }

                    Navigator.pop(context);
                  },
                  child: const Text("Clear"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {
                    widget.onConfirm(_dates ?? [], selectedItem);
                    Navigator.pop(context);
                  },
                  child: const Text("Confirm"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
