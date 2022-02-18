import 'package:flutter/material.dart';

class editGroup extends StatelessWidget {
  final id_grup;
  const editGroup({Key? key, this.id_grup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Grup"),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Tim Nganjuk $id_grup'),
                    ),
                    Divider(
                      color: Color(0xFFFFFFFF),
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
                        child: Text('Add Member'),
                        onPressed: () {},
                      ),
                    ]),
                    TextButton(
                      child: Text(
                        'Simpan',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )));
  }
}
