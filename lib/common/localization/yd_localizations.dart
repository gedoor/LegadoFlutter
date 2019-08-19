import 'package:YueDuFlutter/common/store/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class YDLocalizations extends StatefulWidget {
  final Widget child;
  YDLocalizations({Key key, this.child}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _YDLocalizations();
}

class _YDLocalizations extends State<YDLocalizations> {
  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<GlobalState>(builder: (context, store){
      return new Localizations.override(
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
