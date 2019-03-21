import 'package:flutter/material.dart';

// Index页导航栏
class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 修饰搜索框, 白色背景与圆角
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      alignment: Alignment.center,
      height: 36,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Theme(
        data: ThemeData(primaryColor: Colors.grey),
        child: Column(
          children: <Widget>[
            TextField(
              cursorColor: Colors.grey, // 光标颜色
              // 默认设置
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: "搜索书名",
                hintStyle:
                    TextStyle(fontSize: 18, color: Color(0x80000000)),
              ),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
