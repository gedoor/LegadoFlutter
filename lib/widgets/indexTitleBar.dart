import 'package:flutter/material.dart';

/// 搜索栏部件(完全不能使用,需要另寻其它办法)
class SearchBar extends StatefulWidget {
  @override
  State createState() => new SearchBarState();
}

/// 搜索栏内容构建
class SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.menu),
          Container(
            width: 15,
          ),
          Expanded(
            child: Container(
              // 修饰搜索框, 白色背景与圆角
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              height: 32,
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(8.0)),
                    ),
                    height: 32,
                    width: 32,
                    child: Icon(Icons.search),
                  ),
                  Text(
                    "    搜索书名",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}