import 'dart:html';

import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';

class DetaiLGroup extends StatelessWidget {
  final int id;
  const DetaiLGroup({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          HeaderDetail(),
          BodyDetail(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF2255DC),
      ),
    );
  }
}

class HeaderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 35),
        child: Row(
          children: [
            BackButton(),
            Padding(
                padding: EdgeInsets.only(left: 55),
                child: Text(
                  "Detail Group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 317,
          height: 600,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Carddetail(),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text("List Split Bills"),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                ListSplitBills(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key}) : super(key: key);

  @override
  _CarddetailState createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color(0xFF2255DC),
        child: InkWell(
          onTap: () {
            print('Tapped');
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
                            "Group name :",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                          ),
                          Text(
                            'Lorem',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListSplitBills extends StatefulWidget {
  const ListSplitBills({Key? key}) : super(key: key);

  @override
  _ListSplitBillsState createState() => _ListSplitBillsState();
}

class _ListSplitBillsState extends State<ListSplitBills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color(0xFF2255DC),
        child: InkWell(
          onTap: () {
            print('Tapped');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15, top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 5, bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '00/00/0000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(
                        Icons.delete_forever_outlined,
                      ),
                      onPressed: () {
                        print('test');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
