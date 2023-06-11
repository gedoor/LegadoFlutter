
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../store/global_state.dart';

class YDLocalizations extends StatefulWidget {
  final Widget child;
  YDLocalizations({required this.child});
  @override
  State<StatefulWidget> createState() => _YDLocalizations();
}

class _YDLocalizations extends State<YDLocalizations> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(builder: (context, store) {
      return Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
