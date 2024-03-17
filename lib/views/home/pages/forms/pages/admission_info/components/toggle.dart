part of '../view.dart';

class _Toggle extends StatefulWidget {
  final Widget child;
  final String title;

  const _Toggle({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  State<_Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<_Toggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.grey[100],
        color: Colors.white,
        border: Border.all(color: Color(0xffF5F6FF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff121212),
              ),
            ),
          ),
          widget.child
        ],
      ),
    );
  }
}
