import 'package:flutter/material.dart';

class FormSplitBills extends StatefulWidget {
  const FormSplitBills({Key? key}) : super(key: key);

  @override
  _FormSplitBillsState createState() => _FormSplitBillsState();
}

class _FormSplitBillsState extends State<FormSplitBills> {
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
                            Text("Tim Nganjuk", style: TextStyle(fontSize: 16))
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
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [Text("Name : "), TextField()],
                ))
          ])),
    );
  }
}
