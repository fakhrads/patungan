import 'package:flutter/material.dart';
import 'package:patungan/src/views/detail_group/detailGroup.dart';
import 'package:patungan/src/views/home/Home.dart';
import 'groupCard.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:patungan/src/test/widget/group_card_widget.dart';
import 'package:patungan/src/test/page/group_detail_page.dart';

class GroupContainer extends StatefulWidget {
  const GroupContainer({Key? key}) : super(key: key);

  @override
  _GroupContainerState createState() => _GroupContainerState();
}

class _GroupContainerState extends State<GroupContainer> {
  late List<GrupTransaksi> gTransaksi = [];
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

    this.gTransaksi = await SQLHelper.instance.readAllGrupTransaksi();

    setState(() => isLoading = false);
  }

  final dateFormatter = DateFormat('MMMM dd h:mm a');

  Future deleteGroup(grupId) async {
    await SQLHelper.instance.delete(grupId);
  }

  showAlertDialog(BuildContext context, id) {
    // set up the buttons
    Widget cancelButton = TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE1E1E1))),
      child: Text(
        "No",
        style: TextStyle(color: Color(0xFF000000)),
      ),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      },
    );
    Widget continueButton = TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2255DC))),
      child: Text(
        "Yes",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        deleteGroup(id);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: EdgeInsets.only(left: 12, right: 12),
      title: Text("Delete Group"),
      content: Text("Are you sure you want to delete group?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(children: [
                Container(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          Text("Last Activity"),
                        ],
                      )),
                ),
                ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: gTransaksi.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          color: Colors.transparent,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      final grupTransaksi = gTransaksi[index];
                      final idgrup = grupTransaksi.id_grup;
                      final namagrup = grupTransaksi.nama_grup;
                      final deskripsigrup = grupTransaksi.catatan;
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => DetailGroup(
                                          id: idgrup,
                                          nama_grup: namagrup,
                                          deskripsi: deskripsigrup,
                                        ))));
                          },
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 68,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.indigo,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dateFormatter.format(
                                        grupTransaksi.createdTime as DateTime),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showAlertDialog(
                                          context, grupTransaksi.id_grup);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )));
                    }),
              ])))
    ]);
  }
}
