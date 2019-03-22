import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// 书籍卡片
class BookCard extends StatefulWidget {
  /// 书籍名称
  final String bookName;

  /// 书籍作者
  final String bookAuthor;

  /// 封面地址
  final String bookCover;

  /// 书签章节
  final String bookMark;

  /// 最新章节
  final String bookLastChapter;

  /// 未读章节数
  final int bookUnreadCount;

  /// 是否有新章节
  final bool hasUpdate;

  BookCard(
      {@required this.bookName,
      this.bookAuthor,
      this.bookCover,
      this.bookMark,
      this.bookLastChapter,
      this.bookUnreadCount,
      this.hasUpdate});

  @override
  State createState() => new BookCardState();
}

/// 卡片内容构造
class BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          color: Color(0x40666666),
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  "${widget.bookCover}",
                  width: 60.0,
                  height: 80.0,
                  fit: BoxFit.fill,
                ),
              ),
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
                                "${widget.bookName}",
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
                                color: widget.hasUpdate
                                    ? Color(0xFFFF0000)
                                    : Color(0xFF888888), // 背景颜色
                                child: Text(
                                  "${widget.bookUnreadCount}",
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
                            "${widget.bookAuthor}",
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
                              "${widget.bookMark}",
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
                              "${widget.bookLastChapter}",
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
        ),
      ),
    );
  }
}