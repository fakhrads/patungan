import 'package:flutter/material.dart';
import 'package:patungan/src/views/detail_group/detailGroup.dart';

class FeedCard extends StatefulWidget {
  final String userName;
  final String dateTime;
  final String content;
  const FeedCard(this.userName, this.dateTime, this.content);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            color: Color(0xFF2255DC),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetaiLGroup(id: 1)));
              },
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 10),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 2, left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.userName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    widget.dateTime.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ))
                        ],
                      )),
                ],
              ),
            )));
  }
}
