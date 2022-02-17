import 'package:flutter/material.dart';
import 'package:patungan/src/views/print_splitbills/printdetail.dart';

class ListSplitBills extends StatefulWidget {
  ListSplitBills({Key? key}) : super(key: key);

  @override
  State<ListSplitBills> createState() => _ListSplitBillsState();
}

class _ListSplitBillsState extends State<ListSplitBills> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      "List Split Bills",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                  child: Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: entries.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              color: Colors.transparent,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              color: Colors.indigo,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PrintDetail(),
                                      ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "00/00/0000",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                      showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Center(child: Text("Delete Split Bills")),
                                            content: Text(
                                                "Are you sure want to delete this split bills?"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {}, child: Text("No")),
                                              TextButton(
                                                  onPressed: () {}, child: Text("Yes")),
                                            ],
                                          ));
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                  )
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
