import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/cache_helper.dart';

part 'events.dart';
part 'states.dart';

class ToggleLangBloc extends Bloc<ToggleLangEvents, ToggleLangStates> {
  ToggleLangBloc() : super(ToggleLangStates()) {
    on<ToggleLangEvent>(_toggle);
  }

  void _toggle(ToggleLangEvent event,
      Emitter<ToggleLangStates> emit,) async {
    String newLang = CacheHelper.lang == "en" ? "ar" : "en";
    CacheHelper.setLang(newLang);
    emit(ToggleLangState(newLang));
  }
}
