import 'package:flutter/material.dart';

enum _MenuItem {
  addLocal,
  addWeb,
  cache,
  view,
  makeup,
  webService,
}

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
      PopupMenuButton<_MenuItem>(
        onSelected: (_MenuItem result) {
          print(result);
        },
        icon: Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<_MenuItem>>[
          const PopupMenuItem<_MenuItem>(
            value: _MenuItem.addLocal,
            child: Text('添加本地'),
          ),
          const PopupMenuItem<_MenuItem>(
            value: _MenuItem.addWeb,
            child: Text('添加网址'),
          ),
          const PopupMenuItem<_MenuItem>(
            value: _MenuItem.cache,
            child: Text('一键缓存'),
          ),
          const PopupMenuItem<_MenuItem>(
            value: _MenuItem.view,
            child: Text('网格视图'),
          ),
          const PopupMenuItem<_MenuItem>(
            value: _MenuItem.makeup,
            child: Text('整理书架'),
          ),
          const PopupMenuItem<_MenuItem>(
            value: _MenuItem.webService,
            child: Text('Web服务'),
          ),
        ],
      ),
    ],
    bottom: bottom,
  );
}
