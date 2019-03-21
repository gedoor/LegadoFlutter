import 'dart:ui';

import 'package:YueDuFlutter/widgets/indexTitleBar.dart';
import 'package:flutter/material.dart';

/// 主页
class IndexPage extends StatefulWidget {
  @override
  State createState() => new IndexPageState();
}

// 主页内容构造
class IndexPageState extends State<IndexPage> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: TitleBar(),
      ),
      // 侧边栏菜单
      drawer: Drawer(
        child: Center(
          child: Text("这是测试文字"),
        ),
      ),
      // 主体body部分
      body: Container(
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('test1'),
              Text('test2'),
            ],
          )),
    );
  }
}
