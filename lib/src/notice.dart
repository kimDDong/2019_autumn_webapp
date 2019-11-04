import 'package:flutter/material.dart';

class NoticeList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[

      ],
    );
  }
  final List<Notice> noticeForGraduate = <Notice>[];
}


class Notice{
  final String title;
  final String contents;
  final String date;

  Notice(this.title, this.contents, this.date);

  Map<String, dynamic> toMap() {
    return {
      'title' : title,
      'contents' : contents,
      'date' : date,
    };
  }
}
