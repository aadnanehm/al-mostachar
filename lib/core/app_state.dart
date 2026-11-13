import 'package:flutter/material.dart';

/// Languages supported by the app.
enum AppLang { ar, darija, fr }

/// The two user modes.
enum UserMode { citizen, professional }

/// Global app settings (language + mode). Kept very simple on purpose.
class AppState extends ChangeNotifier {
  AppLang _lang = AppLang.ar;
  UserMode _mode = UserMode.citizen;

  AppLang get lang => _lang;
  UserMode get mode => _mode;

  /// French is left-to-right; Arabic and Darija are right-to-left.
  TextDirection get direction =>
      _lang == AppLang.fr ? TextDirection.ltr : TextDirection.rtl;

  void setLang(AppLang value) {
    _lang = value;
    notifyListeners();
  }

  void setMode(UserMode value) {
    _mode = value;
    notifyListeners();
  }
}

/// One shared instance used by all screens.
final AppState appState = AppState();
