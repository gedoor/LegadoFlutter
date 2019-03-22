import 'package:YueDuFlutter/widgets/bookCard.dart';
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
      // 侧边栏菜单(原生抽屉菜单,只能从边缘划出来,不喜欢这种设计,打算另谋他法)
      // drawer: Drawer(
      //   child: Center(
      //     child: Text("这是测试文字"),
      //   ),
      // ),
      // 主体body部分
      body: Container(
          color: Color(0xFFFFFFFF),
          child: ListView(
            children: <Widget>[
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
              BookCard(),
            ],
          ),
      ),
    );
  }
}
