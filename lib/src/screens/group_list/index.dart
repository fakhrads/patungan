import 'package:flutter/material.dart';
import './grouplist_component.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: [ListCard(), ListCard()],
    )));
  }
}
