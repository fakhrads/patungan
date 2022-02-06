import 'package:flutter/material.dart';
import 'package:patungan/src/components/new_group/newGroupContainer.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFD0D4D7),
        appBar: AppBar(
          backgroundColor: Color(0xFF00052D),
          title: Text("New Group"),
        ),
        body: newGroupContainer());
  }
}
