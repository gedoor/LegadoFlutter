import 'package:flutter/material.dart';

class HomeDrawerItem extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget leading;
  final Widget title;
  final void Function(String data) onTap;
  final Widget trailing;
  final Color color;
  final Color line;
  final bool bottom;

  const HomeDrawerItem({
    Key key,
    this.padding = const EdgeInsets.all(12.0),
    this.margin,
    @required this.leading,
    @required this.title,
    this.onTap,
    this.trailing,
    this.color = Colors.white,
    this.line,
    this.bottom = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return trailing != null
        ? new Container(
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              color: color,
              border: Border(
                bottom: BorderSide(
                  color: line ?? Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      color: color,
                      child: new Row(
                        children: <Widget>[
                          leading,
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: title,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      onTap('left');
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.centerRight,
                      color: color,
                      child: trailing,
                    ),
                    onTap: () {
                      onTap('right');
                    },
                  ),
                ),
              ],
            ),
          )
        : new GestureDetector(
            child: Container(
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                color: color,
                border: Border(
                  bottom: BorderSide(
                    color: line ?? Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  leading,
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: title,
                  ),
                ],
              ),
            ),
            onTap: () {
              onTap("left");
            },
          );
  }
}
