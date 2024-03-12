part of 'form.dart';

class _Btn extends StatefulWidget {
  final RegisterBloc bloc;

  const _Btn({Key? key, required this.bloc}) : super(key: key);

  @override
  State<_Btn> createState() => _BtnState();
}

class _BtnState extends State<_Btn> {
  final relationsBloc = KiwiContainer().resolve<RelationsBloc>()..add(GetRelationsEvent());
  final religionsBloc = KiwiContainer().resolve<ReligionsBloc>()..add(GetReligionsEvent());
  final nationalitiesBloc = KiwiContainer().resolve<NationalitiesBloc>()..add(GetNationalitiesEvent());
  final occupationsBloc = KiwiContainer().resolve<OccupationsBloc>()..add(GetOccupationsEvent());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: FilledButton.tonal(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back"),
        )),
        const SizedBox(width: 8),
        Expanded(
          child: BlocConsumer(
            bloc: widget.bloc,
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                navigateTo(LoginView.route,keepHistory: false);
              }
            },
            builder: (context, state) => AppButton(
              isLoading: state is RegisterLoadingState,
              onPress: () {
                widget.bloc.add(RegisterEvent());
              },
              text: "Create Account",
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    relationsBloc.selectedIndex = null;
    religionsBloc.selectedIndex = null;
    nationalitiesBloc.selectedIndex = null;
    occupationsBloc.selectedIndex = null;
    super.dispose();
  }
}
