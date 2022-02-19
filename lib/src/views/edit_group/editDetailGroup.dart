import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';
import '../detail_group/detailGroup.dart';
import 'package:patungan/src/components/edit_group/editGroup.dart';

class EditDetailGroup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _values = [];
  final id_grup;
  EditDetailGroup({Key? key, this.id_grup}) : super(key: key);

  _onUpdate(int index, String val) async {
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey("id")) {
        if (map["id"] == index) {
          foundKey = index;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": index,
      "value": val,
      "createdTime": DateTime.now(),
    };
    _values.add(json);
    for (Map m in _values) {
      print(m["value"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
