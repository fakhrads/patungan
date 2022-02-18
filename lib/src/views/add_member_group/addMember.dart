import 'package:flutter/material.dart';

class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  int _count = 0;
  String _result = '';

  _row(int index) {
    return Row(
      children: [
        Text('ID: $index'),
        Expanded(
          child: TextFormField(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Form'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                setState(() {
                  _count++;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                setState(() {
                  _count = 0;
                  _result = '';
                });
              },
            )
          ],
        ),
        body: Container(
          child: Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context, index) {
                return _row(index);
              },
            ),
          ),
        ));
  }
}
