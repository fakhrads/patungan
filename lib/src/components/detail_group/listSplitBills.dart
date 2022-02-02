import 'package:flutter/material.dart';

class ListSplitBills extends StatefulWidget {
  ListSplitBills({Key? key}) : super(key: key);

  @override
  State<ListSplitBills> createState() => _ListSplitBillsState();
}

class _ListSplitBillsState extends State<ListSplitBills> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
            width: 317,
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
                    return Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.amber[colorCodes[index]],
                      ),
                      child: Center(child: Text('Entry ${entries[index]}')),
                    );
                  }),
            )),
      ),
    );
  }
}
