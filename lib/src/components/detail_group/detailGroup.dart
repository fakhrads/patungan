import 'package:flutter/material.dart';
import 'package:patungan/src/views/edit_group/editDetailGroup.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

class DetailGroupContainer extends StatefulWidget {
  final nama_grup;
  final deskripsi_grup;
  const DetailGroupContainer({Key? key, this.nama_grup, this.deskripsi_grup})
      : super(key: key);

  @override
  _DetailGroupContainerState createState() => _DetailGroupContainerState();
}

class _DetailGroupContainerState extends State<DetailGroupContainer> {
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
                        widget.nama_grup,
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
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  'Member :',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Text(
                  'Rei',
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
