import 'package:flutter/material.dart';

/// 搜索栏部件(完全不能使用,需要另寻其它办法)
AppBar homeSearchBar({
  String placeholder,
  void Function() onTap,
  void Function(String) onChanged,
  void Function(String) onSubmitted,
  bool enabled = false,
  PreferredSizeWidget bottom,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.grey),
    backgroundColor: Colors.white,
    title: GestureDetector(
      child: Container(
        color: Color.fromARGB(0, 0, 0, 0),
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: TextField(
          enabled: enabled,
          autofocus: enabled,
          decoration: InputDecoration(
            fillColor: Color.fromARGB(55, 128, 128, 128),
            filled: true,
            hintText: placeholder,
            isDense: true,
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
            ),
            suffixIcon: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          onSubmitted: onSubmitted,
          onChanged: onChanged,
        ),
      ),
      onTap: onTap,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.more_vert,
        ),
        tooltip: 'Add Alarm',
        onPressed: () {
          // do nothing
        },
      ),
    ],
    bottom: bottom,
  );
}
