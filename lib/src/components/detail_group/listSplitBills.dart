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
        padding: EdgeInsets.all(12),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            )),
      ),
    );
  }
}
