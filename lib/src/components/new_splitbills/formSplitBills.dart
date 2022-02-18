import 'package:flutter/material.dart';
import 'package:patungan/src/views/match_splitbills/matchSplitBills.dart';

class FormSplitBills extends StatefulWidget {
  final int? id;
  String? namagrup;
  String? deskripsi;
  FormSplitBills({Key? key, this.id, this.namagrup, this.deskripsi})
      : super(key: key);

  @override
  _FormSplitBillsState createState() => _FormSplitBillsState();
}

class _FormSplitBillsState extends State<FormSplitBills> {
  @override
  Widget build(BuildContext context) {
    final na = widget.namagrup;
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
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Group Name: ",
                                style: TextStyle(fontSize: 16)),
                            Text("Tim Tim an", style: TextStyle(fontSize: 16))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date", style: TextStyle(fontSize: 16)),
                            Text("01/01/2022", style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
                    ))),
            Divider(
              color: Colors.white,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Note: ", style: TextStyle(fontSize: 16)),
                            Text("Tim Nganjuk", style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
                    ))),
            Divider(
              color: Colors.white,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(children: [
                  Text(
                    "Item",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "masukan nama makanan",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "masukan harga makanan",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 280, top: 10),
                    child: TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add_circle_sharp,
                          color: Color(0xFF2255DC),
                          size: 50,
                        )),
                  ),
                ])),
            Divider(
              color: Colors.white,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Name : ", style: TextStyle(fontSize: 16)),
                            Text("Tim Nganjuk", style: TextStyle(fontSize: 16))
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Row(
                          children: [
                            Text("Price : ", style: TextStyle(fontSize: 16)),
                            Text("Rp. xxxxx", style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(padding: const EdgeInsets.only(top: 90)),
                FlatButton(
                  onPressed: () {},
                  child: Text("Reset"),
                  color: Colors.grey.shade300,
                ),
                SizedBox(width: 15),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => matchSplitBills(),
                        ));
                  },
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
