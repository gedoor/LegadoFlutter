import 'package:YueDuFlutter/common/store/global_state.dart';
import 'package:YueDuFlutter/pages/home_drawer.dart';
import 'package:YueDuFlutter/widgets/bookListCard.dart';
import 'package:YueDuFlutter/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            title: HomeSearchBar(
              placeholder: "搜索书名、作者",
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.more_vert),
                  tooltip: 'Add Alarm',
                  onPressed: () {
                    // do nothing
                  })
            ],
          ),
          drawer: HomeDrawer(),
          // 主体body部分
          body: Container(
            color: Color(0xFFFFFFFF),
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  bookList.length > 0 ? _renderItem(bookList, index) : null,
              itemCount: bookList.length,
            ),
          ),
        );
      },
    );
  }
}
