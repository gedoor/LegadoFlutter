import 'package:flutter/material.dart';

/// 搜索栏部件(完全不能使用,需要另寻其它办法)
class HomeSearchBar extends StatefulWidget {
  final String placeholder;

  const HomeSearchBar({Key key, this.placeholder}) : super(key: key);
  @override
  State createState() => new _SearchBarState(placeholder);
}

/// 搜索栏内容构建
class _SearchBarState extends State<HomeSearchBar> {
  final String placeholder;
  bool hasShowSearch = false;
  _SearchBarState(this.placeholder);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(55, 128, 128, 128),
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            hintText: this.placeholder,
            border: InputBorder.none),
        onTap: () {
          if (!this.hasShowSearch) {
            this.setState(() {
              this.hasShowSearch = true;
            });
          }
        },
        onSubmitted: (value) {
          print(value);
        },
      ),
    );
  }
}
