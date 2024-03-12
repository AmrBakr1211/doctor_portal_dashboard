part of 'form.dart';

class _DistrictAndCity extends StatelessWidget {
  final RegisterBloc bloc;

  const _DistrictAndCity({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Responsive.isWeb(context)
        ? Column(
            children: [
              district,
              const SizedBox(height: 16),
              city,
            ],
          )
        : Row(
            children: [
              Expanded(child: district),
              const SizedBox(width: 8),
              Expanded(child: city),
            ],
          );
  }

  Widget get district => _Input(
        label: "District",
        hint: "District",
        isRequired: true,
        validator: (value) {
          return InputValidator.requiredValidator(
            value: value!,
            itemName: "District",
            lengthNumber: 2,
          );
        },
        controller: bloc.districtController,
      );

  Widget get city => _Input(
        label: "City",
        hint: "City",
        isRequired: true,
        validator: (value) {
          return InputValidator.requiredValidator(
            value: value!,
            itemName: "City",
            lengthNumber: 2,
          );
        },
        controller: bloc.cityController,
      );
}
