part of 'form.dart';

class _NationalitiesAndOccupations extends StatelessWidget {
  final ValueChanged<int> onSelectNationalities, onSelectOccupations;

  const _NationalitiesAndOccupations(
      {Key? key,
      required this.onSelectNationalities,
      required this.onSelectOccupations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Responsive.isWeb(context)
        ? Column(
            children: [
              nationalities,
              const SizedBox(height: 16),
              occupations,
            ],
          )
        : Row(
            children: [
              Expanded(child: nationalities),
              const SizedBox(width: 8),
              Expanded(child: occupations),
            ],
          );
  }

  Widget get nationalities => _Nationalities(
        onSelect: onSelectNationalities,
      );

  Widget get occupations => _Occupations(
        onSelect: onSelectOccupations,
      );
}
