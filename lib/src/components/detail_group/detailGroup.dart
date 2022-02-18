import 'package:flutter/material.dart';
import 'package:patungan/src/test/model/pesertaTransaksi.dart';
import 'package:patungan/src/views/edit_group/editDetailGroup.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

class DetailGroupContainer extends StatefulWidget {
  final nama_grup;
  final deskripsi_grup;
  final int? id;
  const DetailGroupContainer(
      {Key? key, this.id, this.nama_grup, this.deskripsi_grup})
      : super(key: key);

  @override
  _DetailGroupContainerState createState() => _DetailGroupContainerState();
}

class _DetailGroupContainerState extends State<DetailGroupContainer> {
  late List<PesertaTransaksi> tPes = [];
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

    this.tPes = await SQLHelper.instance.readPesertaTransaksi(widget.id);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Grup : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditDetailGroup()));
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    ]),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      widget.nama_grup,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text(
                      "Deskripsi :",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      widget.deskripsi_grup,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  'Member :',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    for (var item in tPes)
                      Text(
                        item.nama_peserta,
                        style: TextStyle(color: Colors.white),
                      )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
