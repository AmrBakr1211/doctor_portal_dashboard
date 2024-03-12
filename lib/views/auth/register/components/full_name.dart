part of 'form.dart';

class _FullName extends StatelessWidget {
  final RegisterBloc bloc;

  const _FullName({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Responsive.isWeb(context)
        ? Column(
            children: [
              firstName,
              const SizedBox(height: 16),
              fatherName,
              const SizedBox(height: 16),
              grandFatherName,
              const SizedBox(height: 16),
              familyName,
            ],
          )
        : Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: firstName),
                  const SizedBox(width: 8),
                  Expanded(child: fatherName),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: grandFatherName),
                  const SizedBox(width: 8),
                  Expanded(child: familyName),
                ],
              ),
            ],
          );
  }

  Widget get firstName => _Input(
        label: "First Name",
        hint: "First Name",
        isRequired: true,
        validator: (value) {
          return InputValidator.requiredValidator(
              value: value!, itemName: "First Name", lengthNumber: 2);
        },
        controller: bloc.firstNameController,
      );

  Widget get fatherName => _Input(
        hint: "Father Name",
        label: "Father Name",
        isRequired: true,
        validator: (value) {
          return InputValidator.requiredValidator(
              value: value!, itemName: "Father Name", lengthNumber: 2);
        },
        controller: bloc.fatherNameController,
      );

  Widget get grandFatherName => _Input(
        hint: "Grandfather  Name",
        label: "Grandfather  Name",
        isRequired: true,
        validator: (value) {
          return InputValidator.requiredValidator(
            value: value!,
            itemName: "Grandfather  Name",
            lengthNumber: 2,
          );
        },
        controller: bloc.grandFatherNameController,
      );

  Widget get familyName => _Input(
        hint: "Family Name",
        label: "Family Name",
        isRequired: true,
        validator: (value) {
          return InputValidator.requiredValidator(
              value: value!, itemName: "Family Name", lengthNumber: 2);
        },
        controller: bloc.familyNameController,
      );
}
