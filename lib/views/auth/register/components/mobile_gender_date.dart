part of 'form.dart';

class _MobileGenderDate extends StatelessWidget {
  final RegisterBloc bloc;

  const _MobileGenderDate({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Responsive.isWeb(context)
        ? Column(
            children: [
              mobile,
              const SizedBox(height: 16),
              gender,
              const SizedBox(height: 16),
              date,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: mobile),
              const SizedBox(width: 8),
              Expanded(child: gender),
              const SizedBox(width: 8),
              Expanded(child: date),
            ],
          );
  }

  Widget get mobile => _Input(
        label: "Mobile",
        hint: "Mobile",
        validator: InputValidator.validatePhone,
        isRequired: true,
        controller: bloc.phoneController,
      );

  static const genders = ["Male", "Female"];

  Widget get gender => _DropDown(
        list: genders,
        isRequired: true,
        selectedIndex: 0,
        marginBottom: 0,
        onChoose: (value) {
          bloc.selectedGender = genders[value];
        },
        title: "Gender",
        hint: "Gender",
      );

  Widget get date => _DateOfBirth(
        bloc: bloc,
      );
}
