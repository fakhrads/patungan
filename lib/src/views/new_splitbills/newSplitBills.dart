import 'package:flutter/material.dart';
import 'package:patungan/src/components/new_splitbills/formSplitBills.dart';

class NewSplitBills extends StatelessWidget {
  const NewSplitBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD0D4D7),
        body: Column(
          children: [HeaderDetail(), FormSplitBills()],
        ));
  }
}

class HeaderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 35),
        child: Row(
          children: [
            BackButton(),
            Padding(
                padding: EdgeInsets.only(left: 55),
                child: Text(
                  "New Split Bills",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
