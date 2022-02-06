import 'package:flutter/material.dart';
import 'package:patungan/src/views/detail_group/detailGroup.dart';
import 'groupCard.dart';
import '../../db/sql_helper.dart';

class GroupContainer extends StatefulWidget {
  const GroupContainer({Key? key}) : super(key: key);

  @override
  _GroupContainerState createState() => _GroupContainerState();
}

class _GroupContainerState extends State<GroupContainer> {
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
          Text("Total Split Bills kamu adalah",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          Text("Rp. 20.000",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ))
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
                    itemCount: entries.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          color: Colors.transparent,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.indigo,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "00/00/0000",
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
                          ));
                    }),
              ]));
        },
      ))
    ]);
  }
}
