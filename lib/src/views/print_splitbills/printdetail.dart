import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/bodyprint.dart';

class PrintDetail extends StatelessWidget {
  const PrintDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            headerprint(),
            bodyprint()
          ],
        ),
      ),
    );
  }
}

class headerprint extends StatelessWidget {
  const headerprint({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 35),
        child: Row(
          children: [
            BackButton(),
            Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Split Bills Result",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        )
    );
  }
}