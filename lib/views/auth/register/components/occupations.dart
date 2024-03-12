part of 'form.dart';

class _Occupations extends StatefulWidget {
  final ValueChanged<int> onSelect;
  const _Occupations({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<_Occupations> createState() => _OccupationsState();
}

class _OccupationsState extends State<_Occupations> {
  final bloc = KiwiContainer().resolve<OccupationsBloc>()..add(GetOccupationsEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return _DropDown(
            title: "Occupation",
            isRequired: true,
            hint: "Select your occupation",
            list: bloc.stringList,
            selectedIndex: bloc.selectedIndex,
            isLoading: state is GetOccupationsLoadingState,
            onChoose: (value) {
              bloc.selectedIndex = value;
              widget.onSelect(bloc.list[value].id);
            },
          );
        });
  }
}
