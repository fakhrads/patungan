import 'package:flutter/material.dart';
import 'package:patungan/src/views/detail_group/detailGroup.dart';
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

  final List<String> entries = <String>[
    'A',
    'B',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 60, left: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Hai, Fakhri",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ]),
      ),
      SizedBox.expand(
          child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
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
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        DetaiLGroup(id: 1))));
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
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )));
                    }),
              ]));
        },
      ))
    ]);
  }
}
