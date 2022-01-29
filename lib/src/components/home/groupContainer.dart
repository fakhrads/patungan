import 'package:flutter/material.dart';
import 'package:patungan/src/views/detail_group/detailGroup.dart';
import 'groupCard.dart';

class GroupContainer extends StatefulWidget {
  const GroupContainer({Key? key}) : super(key: key);

  @override
  _GroupContainerState createState() => _GroupContainerState();
}

class _GroupContainerState extends State<GroupContainer> {
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
                ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shadowColor: Colors.white,
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetaiLGroup(id: 1)));
                        },
                        title: Text('Two-line ListTile'),
                        subtitle: Text('Here is a $index'),
                      ),
                    );
                  },
                ),
              ]));
        },
      ))
    ]);
  }
}
