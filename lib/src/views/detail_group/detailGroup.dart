import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';
import 'package:patungan/src/components/detail_group/listSplitBills.dart';
import 'package:patungan/src/views/new_splitbills/newSplitBills.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

class DetailGroup extends StatefulWidget {
  final int? id;
  final String? nama_grup;
  final String? deskripsi;
  DetailGroup({Key? key, this.id, this.deskripsi, this.nama_grup})
      : super(key: key);

  @override
  State<DetailGroup> createState() => _DetailGroupState();
}

class _DetailGroupState extends State<DetailGroup> {
  var gTransaksi;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
    debugPrint("HEHE");
  }

  @override
  void dispose() {
    SQLHelper.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.gTransaksi = await SQLHelper.instance.readGrupTransaksi(widget.id);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final grupTransaksi = gTransaksi;
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewSplitBills(
                      idgrup: widget.id,
                      namagrup: widget.nama_grup,
                      deskripsi: widget.deskripsi),
                ));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            width: double.infinity,
            child: Column(
              children: [
                HeaderDetail(),
                DetailGroupContainer(
                  id: widget.id?.toInt(),
                  nama_grup: widget.nama_grup,
                  deskripsi_grup: widget.deskripsi,
                ),
                Expanded(
                  child: ListSplitBills(),
                )
              ],
            )));
  }
}

class HeaderDetail extends StatelessWidget {
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
                  "Detail Group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
