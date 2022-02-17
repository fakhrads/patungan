import 'dart:ffi';

import 'package:flutter/material.dart';

class sesuaikanSplitBills extends StatefulWidget {
  const sesuaikanSplitBills({Key? key}) : super(key: key);

  @override
  _sesuaikanSplitBillsState createState() => _sesuaikanSplitBillsState();
}

class _sesuaikanSplitBillsState extends State<sesuaikanSplitBills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text('Participan',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 30,
                            ),
                            SizedBox(width: 2),
                            Text("Rei Ayanami", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 30,
                            ),
                            SizedBox(width: 2),
                            Text("Rei Ayanami", style: TextStyle(fontSize: 16)),
                          ],
                        )
                      ],
                    ))),
            Divider(
              color: Colors.white,
            ),
            Text(
              "Item",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name :  Ayam Goreng",
                                style: TextStyle(fontSize: 16)),
                            Padding(padding: EdgeInsets.all(2)),
                            Text("Harga : Rp. xxxxxx",
                                style: TextStyle(fontSize: 16)),
                            Padding(padding: EdgeInsets.all(2)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Buyers  :",
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(width: 5),
                                Column(
                                  children: [
                                    Text('Rei Ayanami',
                                        style: TextStyle(fontSize: 16)),
                                    Text('Rei Ayanami',
                                        style: TextStyle(fontSize: 16))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                          showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Center(child: Text("Choose Participant")),
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {}, 
                                          child: Row(
                                            children: [
                                              Icon(Icons.account_circle),
                                              SizedBox(width: 10,),
                                              Text("Rei Ayanami"),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {}, child: Text("No")),
                                  TextButton(
                                      onPressed: () {}, child: Text("Yes")),
                                ],
                              ));
                            }, 
                            child: Icon(
                              Icons.add_circle_sharp,
                              color: Color(0xFF2255DC),
                              size: 40,
                            ),)
                      ],
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text("Reset"),
                  color: Colors.grey.shade300,
                ),
                SizedBox(width: 15),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF2255DC),
                ),
              ],
            )
          ])),
    );
  }
}
