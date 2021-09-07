import 'package:flutter/widgets.dart';
import 'package:immigration_financial/utils/i18n/strings/en_us.dart';
import 'package:immigration_financial/utils/i18n/strings/pt_br.dart';
import 'package:immigration_financial/utils/i18n/strings/translations.dart';

class R {
  static Translations strings = _availableLanguages['en_US'];

  static void load(Locale locale) {
    strings = !_availableLanguages.containsKey(locale.toString())
        ? EnUs()
        : _availableLanguages[locale.toString()];
  }

  static Map<String, dynamic> get _availableLanguages => {
        'en_US': EnUs(),
        'pt_BR': PtBR(),
      };
}
