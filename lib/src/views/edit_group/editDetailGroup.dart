import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';
import '../detail_group/detailGroup.dart';
import 'package:patungan/src/components/edit_group/editGroup.dart';

class EditDetailGroup extends StatelessWidget {
  final id_grup;
  const EditDetailGroup({Key? key, this.id_grup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD0D4D7),
        body: Container(
            width: double.infinity,
            child: Column(
              children: [
                HeaderEditDetail(),
                editGroup(
                  id_grup: id_grup,
                )
              ],
            )));
  }
}

class HeaderEditDetail extends StatefulWidget {
  const HeaderEditDetail({Key? key}) : super(key: key);

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
        ));
  }
}
