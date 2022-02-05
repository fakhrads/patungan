import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';
import 'package:patungan/src/components/detail_group/listSplitBills.dart';
import 'package:patungan/src/views/new_splitbills/newSplitBills.dart';

class DetaiLGroup extends StatelessWidget {
  final int id;
  const DetaiLGroup({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewSplitBills(),
                ));
          },
          child: 
          Icon(Icons.add),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          width: double.infinity,
        child : Column(
          children: [
            HeaderDetail(),
            DetailGroupContainer(),
            Expanded(
              child: ListSplitBills(),
            )
          ],
        )));
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
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Detail Group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
