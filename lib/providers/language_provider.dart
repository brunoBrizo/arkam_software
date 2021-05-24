import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  String _language = "EN";
  bool _modified = false;

  //getter to obtain current theme
  get getLang => _language;

  initializeLanguage() async {
    if (!_modified) {
      List languages = await Devicelocale.preferredLanguages;
      _language = "EN";
      for (String language in languages) {
        switch (language) {
          case 'en':
            _language = "EN";
            break;
          case 'es':
            _language = "ES";
            break;
          case 'pt':
            _language = "PT";
            break;
        }
      }
    }
  }

  void changeLanguage(String language) {
    _modified = true;
    _language = language;
    notifyListeners();
  }
}
