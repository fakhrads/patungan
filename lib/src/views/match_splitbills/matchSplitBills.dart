import 'package:flutter/material.dart';
import 'package:patungan/src/components/match_splitbills/match_splitbills.dart';
class matchSplitBills extends StatelessWidget {
  const matchSplitBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFD0D4D7),
        body: Column(
          children: [HeaderDetail(),sesuaikanSplitBills()],
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
                  "Match Split Bills",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
