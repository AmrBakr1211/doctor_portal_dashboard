part of 'form.dart';

class _Nationalities extends StatefulWidget {
  final ValueChanged<int> onSelect;
  const _Nationalities({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<_Nationalities> createState() => _NationalitiesState();
}

class _NationalitiesState extends State<_Nationalities> {
  final bloc = KiwiContainer().resolve<NationalitiesBloc>()..add(GetNationalitiesEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return _DropDown(
            title: "Nationality",
            isRequired: true,
            hint: "Select your nationality",
            list: bloc.stringList,
            selectedIndex: bloc.selectedIndex,
            isLoading: state is GetNationalitiesLoadingState,
            onChoose: (value) {
              bloc.selectedIndex = value;
              widget.onSelect(bloc.list[value].id);
            },
          );
        });
  }
}
