import 'package:flutter/material.dart';
import 'package:patungan/src/views/edit_group/editDetailGroup.dart';

class DetailGroupContainer extends StatefulWidget {
  const DetailGroupContainer({Key? key}) : super(key: key);

  @override
  _DetailGroupContainerState createState() => _DetailGroupContainerState();
}

class _DetailGroupContainerState extends State<DetailGroupContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 317,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tim_Nganjuk',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditDetailGroup()));
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 22.0,
                          )),
                    ]),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  'Participan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Subprice : ',
                  style: TextStyle(fontSize: 16),
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
