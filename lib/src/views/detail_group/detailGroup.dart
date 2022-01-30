import 'dart:html';

import 'package:flutter/material.dart';
import 'package:patungan/src/components/detail_group/detailGroup.dart';

class DetaiLGroup extends StatelessWidget {
  final int id;
  const DetaiLGroup({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: Column(
          children: [HeaderDetail(), BodyDetail()],
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
                  "Detail Group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 317,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tim_Nganjuk',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  'Participan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Text(
                    'name : ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Item : ', 
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    'Subprice : ',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
