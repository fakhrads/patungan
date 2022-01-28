import 'package:flutter/material.dart';
import 'package:patungan/src/components/home/groupContainer.dart';
import '../new_group/newGroup.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewGroup()));
          },
          backgroundColor: Color(0xFF122E76),
          child: const Icon(Icons.add),
        ),
        backgroundColor: Color(0xFF00052D),
        body:
            Padding(padding: EdgeInsets.only(top: 0), child: GroupContainer()));
  }
}
