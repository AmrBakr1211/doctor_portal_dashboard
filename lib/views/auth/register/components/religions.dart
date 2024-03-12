part of 'form.dart';

class _Religions extends StatefulWidget {
  final ValueChanged<int> onConfirm;

  const _Religions({Key? key, required this.onConfirm}) : super(key: key);

  @override
  State<_Religions> createState() => _ReligionsState();
}

class _ReligionsState extends State<_Religions> {
  final bloc = KiwiContainer().resolve<ReligionsBloc>()..add(GetReligionsEvent());

  @override
  Widget build(BuildContext context) {
    if (bloc.list.isEmpty && bloc.state is GetReligionsSuccessState) {
      return const SizedBox.shrink();
    }
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return _DropDown(
            list: bloc.stringList,
            marginBottom: 0,
            isRequired: false,
            selectedIndex: bloc.selectedIndex,
            onChoose: (value) {
              bloc.selectedIndex = value;
              widget.onConfirm(value);
            },
            isLoading: state is GetReligionsLoadingState,
            hint: "Religions",
            title: "How did you hear about us ?",
          );
        });
  }
}
