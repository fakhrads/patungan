import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';
import '../detail_group/detailGroup.dart';
import 'package:patungan/src/components/edit_group/editGroup.dart';

class EditDetailGroup extends StatelessWidget {
  const EditDetailGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        width: double.infinity,
        child : Column(
          children: [
            HeaderEditDetail(),
            editGroup()
          ],
        )
      )
    );
  }
}

class HeaderEditDetail extends StatefulWidget {
  const HeaderEditDetail({ Key? key }) : super(key: key);

  @override
  _HeaderEditDetailState createState() => _HeaderEditDetailState();
}

class _HeaderEditDetailState extends State<HeaderEditDetail> {
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
                  "Edit Detail Group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        )
    );
  }
}