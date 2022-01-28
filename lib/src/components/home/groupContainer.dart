import 'package:flutter/material.dart';
import 'groupCard.dart';

class GroupContainer extends StatelessWidget {
  final List<String> entries = <String>[
    'fakhrads',
    'you\'re mine',
    'hilman',
    'hilman',
    'hilman',
    'hilman',
    'hilman',
    'hilman',
    'hilman'
  ];
  final List<String> totals = <String>[
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
    '@fakhrads',
  ];
  final List<String> content = <String>[
    'Saya hari ini sedang patah hati sedang patah hati sedang patah hati sedang patah hati sedang patah hati sedang patah hati',
    'Saya suka sekali bermain bola',
    'Selamat malam kesepian',
    'Selamat malam kesepian',
    'Selamat malam kesepian',
    'Selamat malam kesepian',
    'Selamat malam kesepian',
    'Selamat malam kesepian',
    'Selamat malam kesepian'
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
                ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shadowColor: Colors.white,
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          debugPrint("Tes");
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
