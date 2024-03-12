part of '../view.dart';

class _Admitted extends StatefulWidget {
  const _Admitted({Key? key}) : super(key: key);

  @override
  State<_Admitted> createState() => _AdmittedState();
}

class _AdmittedState extends State<_Admitted> {
  List<String> list = ["Ambulatory", "Non Ambulatory", "Ambulatory With Assist :"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return shape2();
  }

  Widget shape2() {
    return _Toggle(
        title: "Admitted",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            list.length,
            (index) => IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
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
                  if (index == list.length - 1 && selectedIndex == index)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget shape1() {
    return SizedBox(
      height: 54,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 12),
              decoration: BoxDecoration(
                color: const Color(0xffFAFBFD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Admitted",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff717171)),
              ),
            ),
          ),
          const SizedBox(width: 6),
          ...List.generate(
            list.length,
            (index) => Expanded(
              flex: index == list.length - 1 ? 2 : 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
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
                  index == list.length - 1 && selectedIndex == index
                      ? Expanded(
                          child: TextFormField(
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ))
                      : const Expanded(
                          child: SizedBox(
                            height: 40,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void choose(index) {
    selectedIndex = index;
    setState(() {});
  }
}
