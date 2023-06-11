import 'package:flutter/material.dart';

class HomeDrawerHeader extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final double height;
  final Widget child;

  const HomeDrawerHeader({
    required this.child,
    this.height = 80.0,
    this.margin = const EdgeInsets.only(bottom: 8.0),
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: statusBarHeight + height,
      margin: margin,
      padding: padding.add(EdgeInsets.only(top: statusBarHeight)),
      alignment: Alignment.centerLeft,
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: Divider.createBorderSide(context),
      //   ),
      // ),
      child: child,
    );
  }
}
