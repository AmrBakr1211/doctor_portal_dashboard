part of 'form.dart';

class _EmailReligions extends StatefulWidget {
  final RegisterBloc bloc;

  const _EmailReligions({Key? key, required this.bloc}) : super(key: key);

  @override
  State<_EmailReligions> createState() => _EmailReligionsState();
}

class _EmailReligionsState extends State<_EmailReligions> {
  @override
  Widget build(BuildContext context) {
    return !Responsive.isWeb(context)
        ? Column(
            children: [
              religions,
              const SizedBox(height: 16),
              email,
            ],
          )
        : Row(
            children: [
              Expanded(child: religions),
              const SizedBox(width: 8),
              Expanded(child: email),
            ],
          );
  }

  Widget get email => _Input(
        controller: widget.bloc.emailController,
        label: "Email Address",
        hint: "Email Address",
      );

  Widget get religions => _Religions(
        onConfirm: (value) {
          widget.bloc.selectedReligionID = value;
        },
      );
}
