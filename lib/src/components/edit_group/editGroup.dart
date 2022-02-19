import 'package:flutter/material.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/widget/group_form_widget.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

class editGroup extends StatelessWidget {
  final id_grup;
  final nama_grup;
  final catatan;
  // final GrupTransaksi? grupTransaksi;
  const editGroup({
    Key? key,
    // this.grupTransaksi,
    this.id_grup,
    this.nama_grup,
    this.catatan,
  }) : super(key: key);

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
                        decoration: InputDecoration(hintText: '$nama_grup')),
                    Divider(
                      color: Color(0xFFFFFFFF),
                    ),
                    Text('Deskripsi Group'),
                    TextField(
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        hintText: '$catatan',
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
