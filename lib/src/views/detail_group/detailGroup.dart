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
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Carddetail(),
                Padding(padding: EdgeInsets.only(bottom: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key}) : super(key: key);

  @override
  _CarddetailState createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color(0xFF2255DC),
        child: InkWell(
          onTap: () {
            print('Tapped');
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15, top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Group name :", 
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          

                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
