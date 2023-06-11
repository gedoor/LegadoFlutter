import 'package:flutter/material.dart';

/// 卡片内容构造
class BookCard extends StatelessWidget {
  final BookCardModel bookCardModel;

  BookCard(this.bookCardModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 修饰容器
      decoration: BoxDecoration(
        color: Color(0x40666666), // 背景色
        borderRadius: BorderRadius.all(Radius.circular(6.0)), // 边框样式
      ),
      margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0), // 外边距
      padding: EdgeInsets.all(4.0), // 内间距
      child: Row(
        children: <Widget>[
          // 书籍封面
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              "${bookCardModel.bookCover}",
              width: 60.0,
              height: 80.0,
              fit: BoxFit.fill,
            ),
          ),
          // 书籍信息
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        // 书籍名称
                        Expanded(
                          child: Text(
                            "${bookCardModel.bookName}",
                            style: TextStyle(
                              fontFamily: "KTGB2312", // 字体名称
                              fontWeight: FontWeight.normal, // 字重
                              fontSize: 16.0, // 字号
                            ),
                            maxLines: 1,
                          ),
                        ),
                        // 右上角未读章节数
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            color: bookCardModel.hasUpdate
                                ? Color(0xFFFF0000)
                                : Color(0xFF888888), // 背景颜色
                            child: Text(
                              "${bookCardModel.bookUnreadCount}",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF), // 字体颜色
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 书籍作者
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_box, // 作者图标
                        size: 18.0,
                      ),
                      Text(
                        "${bookCardModel.bookAuthor}",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "KTGB2312",
                          fontSize: 12.0, // 字号
                        ),
                      ),
                    ],
                  ),
                  // 书签章节
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.photo_album, // book 书签图标
                        size: 18.0,
                      ),
                      Expanded(
                        child: Text(
                          "${bookCardModel.bookMark}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // 溢出的文本用省略号代替
                          style: TextStyle(
                            fontFamily: "KTGB2312",
                            fontSize: 11.0, // 字号
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 最新章节
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.move_to_inbox, // 最新章节图标
                        size: 18.0,
                      ),
                      Expanded(
                        child: Text(
                          "${bookCardModel.bookLastChapter}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // 溢出的文本用省略号代替
                          style: TextStyle(
                            fontFamily: "KTGB2312",
                            fontSize: 11.0, // 字号
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookCardModel {
  late String bookName;

  /// 书籍作者
  late String bookAuthor;

  /// 封面地址
  late String bookCover;

  /// 书签章节
  late String bookMark;

  /// 最新章节
  late String bookLastChapter;

  /// 未读章节数
  late int bookUnreadCount;

  /// 是否有新章节
  late bool hasUpdate;

  BookCardModel(
      {required this.bookName,
      required this.bookAuthor,
      required this.bookCover,
      required this.bookMark,
      required this.bookLastChapter,
      required this.bookUnreadCount,
      required this.hasUpdate});

  BookCardModel.fromMap(data) {
    bookName = data["bookName"];
    bookAuthor = data["bookAuthor"];
    bookCover = data["bookCover"];
    bookMark = data["bookMark"];
    bookLastChapter = data["bookLastChapter"];
    bookUnreadCount = data["bookUnreadCount"];
    hasUpdate = data["hasUpdate"];
  }
}
