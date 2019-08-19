import 'package:YueDuFlutter/common/store/locale_state.dart';
import 'package:YueDuFlutter/common/store/supported_locales_state.dart';
import 'package:YueDuFlutter/common/store/theme_data_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class GlobalState {
  final Locale locale;
  Locale platformLocale;
  final ThemeData themeData;
  List<Locale> supportedLocales;
  List bookList = [
    {
      "bookName": "牧神记",
      "bookAuthor": "宅猪",
      "bookCover": "https://www.biqubao.com/cover/18/18569/18569s.jpg",
      "bookMark": "第一章 天黑别出门",
      "bookLastChapter": "第一五零五章 道问",
      "bookUnreadCount": 1572 - 1,
      "hasUpdate": true,
    },
    {
      "bookName": "牧神记",
      "bookAuthor": "宅猪",
      "bookCover": "https://www.biqubao.com/cover/18/18569/18569s.jpg",
      "bookMark": "第一章 天黑别出门",
      "bookLastChapter": "第一五零五章 道问",
      "bookUnreadCount": 1572 - 1,
      "hasUpdate": true,
    }
  ];
  GlobalState({this.locale, this.supportedLocales, this.themeData});
}

GlobalState appReducer(GlobalState state, action) {
  return GlobalState(
    locale: localeReducer(state.locale, action),
    themeData: themeDataReducer(state.themeData, action),
    supportedLocales: supportedLocalesReducer(state.supportedLocales, action),
  );
}

final List<Middleware<GlobalState>> middleware = [];
