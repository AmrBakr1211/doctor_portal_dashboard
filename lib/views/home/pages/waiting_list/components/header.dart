part of '../view.dart';

class _Header extends StatefulWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> with SingleTickerProviderStateMixin {
  final searchBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xffF5F6FF),
    ),
  );
  late TabController tabController;

  final list = [
    "Cash",
    "Returned",
    "Waiting",
    "Male",
    "Female",
    "Total",
    "Credit",
    "Followup",
    "Active",
    "New_Pat",
    "New_Con",
    "Served",
    "With_Apt",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 13, vsync: this);
  }

  int selectedIndex = 0;
  String selectedDate = "March 8, 2024";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffF5F6FF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(Duration(days: 730)),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                  );
                  if (result != null) {
                    selectedDate = DateFormat("MMMM d, y").format(result);
                    setState(() {});
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppImage(
                        "calender.svg",
                        height: 24,
                        width: 24,
                        fit: BoxFit.fill,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        selectedDate,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff121212)),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: AppImage("arrow_down2.svg"),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              const SearchBox(prefixIcon: "search2.svg", hintText: "Find a doctor"),
              SizedBox(width: 16),
              AppImage("info_with_circle.svg", height: 32, width: 32, fit: BoxFit.fill),
              SizedBox(width: 8),
              AppImage(
                "search_with_circle.svg",
                height: 32,
                width: 32,
                fit: BoxFit.fill,
              )
            ],
          ),
          SizedBox(height: 20),
          DefaultTabController(
              length: 13,
              child: TabBar(
                isScrollable: true,
                controller: tabController,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorWeight: 0,
                labelPadding: EdgeInsetsDirectional.only(end: 8),
                tabAlignment: TabAlignment.start,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                dividerHeight: 0,
                indicator: const BoxDecoration(),
                tabs: List.generate(
                  13,
                  (index) => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? const Color(0xff5597F5).withOpacity(.12) : Colors.white,
                      borderRadius: BorderRadius.circular(48),
                      border: selectedIndex == index
                          ? null
                          : Border.all(
                              color: const Color(0xffF5F6FF),
                            ),
                    ),
                    child: Text(
                      "0 ${list[index]}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selectedIndex == index ? Theme.of(context).primaryColor : const Color(0xff8A99AA),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _ItemHeader extends StatelessWidget {
  final String title, value;

  const _ItemHeader({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff717171)),
          ),
          const SizedBox(width: 14),
          Flexible(
            child: Text(
              value,
              maxLines: 2,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff0496FF)),
            ),
          ),
        ],
      ),
    );
  }
}
