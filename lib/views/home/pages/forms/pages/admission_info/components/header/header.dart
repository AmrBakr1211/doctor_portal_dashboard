part of '../../view.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffF5F6FF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Responsive(
        web: _HeaderWeb(),
        mobile: _HeaderMobile(),
        tablet: _HeaderTablet(),
      ),
    );
  }
}

class _ItemHeader extends StatelessWidget {
  final String title, value;

  const _ItemHeader({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff717171)),
          ),
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
    );
  }
}
