part of 'form.dart';

class _NameMobileRelations extends StatelessWidget {
  final RegisterBloc bloc;

  const _NameMobileRelations({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Responsive.isWeb(context)
        ? Column(
            children: [
              name,
              const SizedBox(height: 16),
              mobile,
              const SizedBox(height: 16),
              relations,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: name),
              const SizedBox(width: 8),
              Expanded(child: mobile),
              const SizedBox(width: 8),
              Expanded(child: relations),
            ],
          );
  }

  Widget get name => _Input(
        controller: bloc.emergencyNameController,
        label: "Full Name",
        hint: "Full Name",
        validator: (value) {
          return InputValidator.requiredValidator(
            value: value!,
            itemName: "Full Name",
            lengthNumber: 2,
          );
        },
        isRequired: true,
      );

  Widget get mobile => _Input(
        controller: bloc.emergencyMobileController,
        label: "Mobile",
        hint: "Mobile",
        validator: InputValidator.validatePhone,
        isRequired: true,
      );

  Widget get relations => _Relations(
        onConfirm: (value) {
          bloc.selectedRelationId = value;
        },
      );
}
