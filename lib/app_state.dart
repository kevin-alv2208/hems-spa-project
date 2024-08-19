import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _idioma = prefs.getBool('ff_idioma') ?? _idioma;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _idioma = false;
  bool get idioma => _idioma;
  set idioma(bool value) {
    _idioma = value;
    prefs.setBool('ff_idioma', value);
  }

  int _textosM = 16;
  int get textosM => _textosM;
  set textosM(int value) {
    _textosM = value;
  }

  int _Titulos = 20;
  int get Titulos => _Titulos;
  set Titulos(int value) {
    _Titulos = value;
  }

  int _textosP = 14;
  int get textosP => _textosP;
  set textosP(int value) {
    _textosP = value;
  }

  int _botones = 18;
  int get botones => _botones;
  set botones(int value) {
    _botones = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
