import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'language/yd_string_base.dart';
import 'language/yd_string_en.dart';
import 'language/yd_string_zh.dart';

class YDLocalizationsDelegate extends LocalizationsDelegate {
  @override
  bool isSupported(Locale locale) {
    return ['zh', 'en'].contains(locale.languageCode);
  }

  @override
  Future<_YDLocalizations> load(Locale locale) {
    return SynchronousFuture<_YDLocalizations>(
        _YDLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return false;
  }

  static YDLocalizationsDelegate delegate = YDLocalizationsDelegate();
}

class _YDLocalizations {
  final Locale locale;
  _YDLocalizations(this.locale);

  static Map<String, YDStringBase> _localizedValues = {
    'en': YDStringEn(),
    'en': YDStringZh(),
  };

  YDStringBase? get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues['en'];
  }

  static _YDLocalizations of(BuildContext context) {
    return Localizations.of(context, _YDLocalizations);
  }
}
