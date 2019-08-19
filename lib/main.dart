import 'package:YueDuFlutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'common/localization/yd_localizations.dart';
import 'common/store/global_state.dart';

// App主入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = new Store<GlobalState>(
    appReducer,
    middleware: middleware,
    initialState: new GlobalState(
      themeData: ThemeData(
        primaryColor: Color(0xFF666666),
      ),
      locale: Locale('zh', 'CH'),
    ),
  );

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<GlobalState>(builder: (context, store) {
        return MaterialApp(
          title: '阅读',
          // theme: ThemeData(primaryColor: Color(0xFF666666)),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          locale: store.state.locale,
          supportedLocales: [store.state.locale],
          theme: store.state.themeData,
          routes: {
            HomePage.sName: (context) {
              store.state.platformLocale =
                  WidgetsBinding.instance.window.locale;
              return new YDLocalizations(child: HomePage());
            }
          },
          // home: MainPage(),
        );
      }),
    );
  }
}
