part of '../view.dart';

class _Toggle extends StatefulWidget {
  final Widget child;
  final String title;

  const _Toggle({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  State<_Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<_Toggle> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
      // return shape2;

    return GestureDetector(
      onTap: () {
        isChecked = !isChecked;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          // color: Color(0xffFAFBFD),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = !isChecked;
                    setState(() {});
                  },
                ),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff717171)),
                ),
              ],
            ),
            Visibility(
              visible: true,
              child: widget.child,
            )
          ],
        ),
      ),
    );
  }

  Widget get shape2 {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff717171)),
        ),
        backgroundColor: Colors.grey[100],
        childrenPadding: const EdgeInsets.all(16),
        expandedAlignment: Alignment.centerLeft,
        collapsedBackgroundColor: Colors.grey[200],
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Checkbox(
          value: isChecked,
          onChanged: (value) {
            isChecked = !isChecked;
            setState(() {});
          },
        ),
        children: [
          widget.child
          // Visibility(
          //   visible: isChecked,
          //   child: widget.child,
          // )
        ],
        // trailing: ,
      ),
    );
  }
}
