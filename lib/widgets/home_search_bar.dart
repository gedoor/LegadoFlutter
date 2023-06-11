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
  required String placeholder,
  required void Function() onTap,
  required void Function(String) onChanged,
  required void Function(String) onSubmitted,
  bool enabled = false,
  PreferredSizeWidget? bottom,
}) {
  Widget content = TextField(
    enabled: enabled,
    autofocus: enabled,
    decoration: InputDecoration(
      fillColor: Color.fromARGB(0, 0, 0, 0),
      hintText: placeholder,
      filled: true,
      isDense: true,
      hintStyle: TextStyle(fontSize: 15),
      border: InputBorder.none,
    ),
    onSubmitted: onSubmitted,
    onChanged: onChanged,
  );

  content = Container(
    height: kToolbarHeight - 12,
    decoration: BoxDecoration(
        color: Color.fromARGB(55, 128, 128, 128),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    padding: EdgeInsets.only(left: 12, right: 12),
    child: Row(
      children: <Widget>[
        Icon(Icons.search),
        Expanded(
          child: content,
        ),
        Icon(Icons.keyboard_arrow_right)
      ],
    ),
  );

  content = GestureDetector(
    child: content,
    onTap: onTap,
  );

  return AppBar(
    iconTheme: IconThemeData(color: Colors.grey),
    backgroundColor: Colors.white,
    title: content,
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
