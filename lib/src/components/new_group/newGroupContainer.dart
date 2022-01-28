import 'package:flutter/material.dart';

class newGroupContainer extends StatefulWidget {
  const newGroupContainer({Key? key}) : super(key: key);

  @override
  _newGroupContainerState createState() => _newGroupContainerState();
}

class _newGroupContainerState extends State<newGroupContainer> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Group'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan Nama Group',
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Text('Deskripsi Group'),
                      TextField(
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: 'Masukkan deskripsi',
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Row(children: [
                        Text('Member'),
                        TextButton(
                          child: Text('Add Column'),
                          onPressed: () => _incrementCounter(),
                        ),
                        TextButton(
                          child: Text(
                            'Delete Column',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () => _decrementCounter(),
                        ),
                      ]),
                      Expanded(
                          child: ListView.builder(
                              itemCount: _counter,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return new TextField(
                                  cursorHeight: 20,
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan deskripsi',
                                  ),
                                );
                              })),
                      TextButton(
                        child: Text(
                          'Simpan',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () => _decrementCounter(),
                      ),
                    ],
                  ),
                ))));
  }
}
