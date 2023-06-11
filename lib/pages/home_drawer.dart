
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../common/store/global_state.dart';
import '../widgets/home_drawer_header.dart';
import '../widgets/home_drawer_item.dart';

/**
 * 主页drawer
 * Created by guoshuyu
 * Date: 2018-07-18
 */
class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreBuilder<GlobalState>(
        builder: (context, store) {
          return Drawer(
            child: Container(
              color: store.state.themeData.primaryColor,
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: Material(
                    color: Color(0xFFFFFFFF),
                    child: Column(
                      children: <Widget>[
                        HomeDrawerHeader(
                          child: Text(
                            "阅读",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: Text("书源管理"),
                          onTap: (str) {
                            print(str);
                          },
                          line: Colors.black,
                          bottom: false,
                        ),
                        HomeDrawerItem(
                            leading: Icon(Icons.color_lens),
                            title: Text("替换净化"),
                            onTap: (str) {
                              print("content");
                            },
                            line: Colors.black,
                            bottom: false),
                        HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: Text("下载任务"),
                          bottom: true,
                          onTap: (str) {
                            print("content");
                          },
                          line: Colors.black,
                        ),
                        HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: Text("主题"),
                          // trailing: Icon(Icons.brightness_2),
                          bottom: true,
                          onTap: (str) {
                            print("content $str");
                          },
                          line: Colors.black,
                        ),
                        HomeDrawerItem(
                            leading: Icon(Icons.settings),
                            title: Text("设置"),
                            // dense: true,
                            onTap: (str) {
                              print("content");
                            },
                            line: Colors.black,
                            bottom: false),
                        HomeDrawerItem(
                            leading: Icon(Icons.help),
                            title: Text("关于"),
                            onTap: (str) {
                              print("content");
                            },
                            line: Colors.black,
                            bottom: false),
                        HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: Text("捐赠"),
                          bottom: true,
                          onTap: (str) {
                            print("content");
                          },
                          line: Colors.black,
                        ),
                        HomeDrawerItem(
                            leading: Icon(Icons.color_lens),
                            title: Text("备份"),
                            onTap: (str) {
                              print("content");
                            },
                            line: Colors.black,
                            bottom: false),
                        HomeDrawerItem(
                            leading: Icon(Icons.color_lens),
                            title: Text("恢复"),
                            onTap: (str) {
                              print("content $str");
                            },
                            line: Colors.black,
                            bottom: false),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
