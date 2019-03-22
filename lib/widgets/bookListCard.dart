import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// 书籍卡片
class BookCard extends StatefulWidget {
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
                  "https://www.biqubao.com/cover/0/144/144s.jpg",
                  width: 60.0,
                  height: 80.0,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // 书籍名称
                          Expanded(
                            child: Text(
                              "凡人修仙传",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          // 右上角未读章节数
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              color: Color(0xFF888888), // 背景颜色
                              child: Text(
                                "1234",
                                style:
                                    TextStyle(color: Color(0xFFFFFFFF) // 字体颜色
                                        ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 书籍作者
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_box,  // 作者图标
                            size: 18.0,
                          ),
                          Text(
                            "忘语",
                            maxLines: 1,
                          ),
                        ],
                      ),
                      // 阅读进度
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.photo_album, // book 书签图标
                            size: 18.0,
                          ),
                          Expanded(
                            child: Text(
                              "第三十八章 柳暗花明",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,  // 溢出的文本用省略号代替
                            ),
                          ),
                        ],
                      ),
                      // 最新章节
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.move_to_inbox,  // 最新章节图标
                            size: 18.0,
                          ),
                          Expanded(
                            child: Text(
                              "第七百八十一章 围追堵截 测试测试测试测试测试",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,  // 溢出的文本用省略号代替
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
