import 'package:YueDuFlutter/common/store/global_state.dart';
import 'package:YueDuFlutter/widgets/home_drawer_header.dart';
import 'package:YueDuFlutter/widgets/home_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

/**
 * 主页drawer
 * Created by guoshuyu
 * Date: 2018-07-18
 */
class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: new StoreBuilder<GlobalState>(
        builder: (context, store) {
          return new Drawer(
            child: new Container(
              color: store.state.themeData.primaryColor,
              child: new SingleChildScrollView(
                child: Container(
                  constraints: new BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: new Material(
                    color: Color(0xFFFFFFFF),
                    child: new Column(
                      children: <Widget>[
                        new HomeDrawerHeader(
                          child: new Text(
                            "阅读",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("书源管理"),
                          onTap: (str) {
                            print(str);
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("替换净化"),
                          onTap: (str) {
                            print("content");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("下载任务"),
                          bottom: true,
                          onTap: (str) {
                            print("content");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("主题"),
                          trailing: Icon(Icons.brightness_2),
                          bottom: true,
                          onTap: (str) {
                            print("content $str");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.settings),
                          title: new Text("设置"),
                          // dense: true,
                          onTap: (str) {
                            print("content");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.help),
                          title: new Text("关于"),
                          onTap: (str) {
                            print("content");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("捐赠"),
                          bottom: true,
                          onTap: (str) {
                            print("content");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("备份"),
                          onTap: (str) {
                            print("content");
                          },
                        ),
                        new HomeDrawerItem(
                          leading: Icon(Icons.color_lens),
                          title: new Text("恢复"),
                          onTap: (str) {
                            print("content $str");
                          },
                        ),
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
