import 'package:flutter/material.dart';

class HomeDrawerItem extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final void Function(String data) onTap;
  final Color color;
  final Color line;
  final bool bottom;

  const HomeDrawerItem({
    required this.leading,
    required this.title,
    required this.onTap,
    this.color = Colors.white,
    required this.line,
    required this.bottom,
  });
  @override
  Widget build(BuildContext context) {
    return bottom
        ? Container(
            padding: EdgeInsets.all(12),
            // margin: margin,
            decoration: BoxDecoration(
              color: color,
              border: Border(
                bottom: BorderSide(color: line),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      color: color,
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
                      onTap('left');
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.centerRight,
                      color: color,
                      child: Icon(Icons.brightness_2),
                    ),
                    onTap: () {
                      onTap('right');
                    },
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            child: Container(
              padding: EdgeInsets.all(12),
              // margin: margin,
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
