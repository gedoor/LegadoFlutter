import 'package:YueDuFlutter/common/store/global_state.dart';
import 'package:YueDuFlutter/common/utils/navigator_utils.dart';
import 'package:YueDuFlutter/pages/discover.dart';
import 'package:YueDuFlutter/pages/home_drawer.dart';
import 'package:YueDuFlutter/widgets/bookListCard.dart';
import 'package:YueDuFlutter/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'bookSearch.dart';

/// 主页
class HomePage extends StatelessWidget {
  static final String sName = "/";

  _renderItem(list, idx) {
    return BookCard(BookCardModel.fromMap(list[idx]));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalState, List>(
      converter: (store) => store.state.bookList,
      builder: (context, bookList) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: homeSearchBar(
              placeholder: "搜索书名、作者",
              enabled: false,
              onTap: () {
                print(1111);
                NavigatorUtils.pushNamed(context, BookSearchPage.sName);
              },
              bottom: TabBar(
                labelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(
                    text: '书架',
                  ),
                  Tab(
                    text: '发现',
                  ),
                ],
              ),
            ),
            drawer: HomeDrawer(),
            // 主体body部分
            body: Container(
              padding: EdgeInsets.only(top: 3),
              color: Color(0xFFFFFFFF),
              child: TabBarView(
                children: <Widget>[
                  ListView.builder(
                      itemBuilder: (context, index) => bookList.length > 0
                          ? _renderItem(bookList, index)
                          : null,
                      itemCount: bookList.length,
                    ),
                  DiscoverPage()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
