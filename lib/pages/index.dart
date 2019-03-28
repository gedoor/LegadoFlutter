import 'package:YueDuFlutter/widgets/bookListCard.dart';
import 'package:YueDuFlutter/widgets/indexTitleBar.dart';
import 'package:flutter/material.dart';

/// 主页
class IndexPage extends StatefulWidget {
  @override
  State createState() => new IndexPageState();
}

// 主页内容构造
class IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: SearchBar(),
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
            BookCard(
              bookName: "牧神记",
              bookAuthor: "宅猪",
              bookCover: "https://www.biqubao.com/cover/18/18569/18569s.jpg",
              bookMark: "第一章 天黑别出门",
              bookLastChapter: "第一五零五章 道问",
              bookUnreadCount: 1572 - 1,
              hasUpdate: true,
            ),
            BookCard(
              bookName: "修真聊天群",
              bookAuthor: "圣骑士的传说",
              bookCover: "https://www.biqubao.com/cover/2/2324/2324s.jpg",
              bookMark: "第二十四章 宋书航同学，有你的大快递",
              bookLastChapter: "第2575章 要不要盘根霸神柱之金龙柱出",
              bookUnreadCount: 2615 - 31,
              hasUpdate: true,
            ),
            BookCard(
              bookName: "科技霸权",
              bookAuthor: "秒速九光年",
              bookCover: "https://www.biqubao.com/cover/25/25075/25075s.jpg",
              bookMark: "第三百一十八章 下一代计算规则，将由我们来制定！",
              bookLastChapter: "第三百二十章 事情闹大了，博登湖惨案",
              bookUnreadCount: 2,
              hasUpdate: false,
            ),
          ],
        ),
      ),
    );
  }
}
