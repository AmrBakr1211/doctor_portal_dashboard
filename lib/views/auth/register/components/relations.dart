part of 'form.dart';

class _Relations extends StatefulWidget {
  final ValueChanged<int> onConfirm;

  const _Relations({Key? key, required this.onConfirm}) : super(key: key);

  @override
  State<_Relations> createState() => _RelationsState();
}

class _RelationsState extends State<_Relations> {
  final bloc = KiwiContainer().resolve<RelationsBloc>()..add(GetRelationsEvent());
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return _DropDown(
            list: bloc.stringList,
            isRequired: true,
            marginBottom: 0,
            selectedIndex: bloc.selectedIndex,
            onChoose: (value) {
              bloc.selectedIndex = value;
              widget.onConfirm(bloc.list[value].id);
            },
            isLoading: state is GetRelationsLoadingState,
            hint: "Relationship",
            title: "Relationship",
          );
        });
  }
}
