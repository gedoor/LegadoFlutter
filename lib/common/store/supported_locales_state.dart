import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final supportedLocalesReducer = combineReducers<List<Locale>>([
  TypedReducer<List<Locale>, RefreshLocaleAction>(_refresh),
]);

List<Locale> _refresh(
    List<Locale> supportedLocales, RefreshLocaleAction action) {
  supportedLocales = action.supportedLocales;
  return supportedLocales;
}

class RefreshLocaleAction {
  final List<Locale> supportedLocales;

  RefreshLocaleAction(this.supportedLocales);
}
