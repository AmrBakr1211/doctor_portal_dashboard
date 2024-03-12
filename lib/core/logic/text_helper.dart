import 'cache_helper.dart';

class TextHelper {
  static String text(arb, eng) {
    if (CacheHelper.lang == "en") {
      if (eng.isEmpty) {
        return arb;
      }
      return eng;
    } else {
      if (arb.isEmpty) {
        return eng;
      }
      return arb;
    }
  }
}
