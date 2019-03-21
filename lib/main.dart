import 'package:flutter/material.dart';
import 'package:YueDuFlutter/pages/index.dart';

// App主入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 此小组件是应用程序的根容器。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '阅读',
      theme: ThemeData(
        primaryColor: Color(0xFF666666),
      ),
      home: IndexPage(),
    );
  }
}