import 'package:flutter/material.dart';

class DetailGroupContainer extends StatefulWidget {
  const DetailGroupContainer({Key? key}) : super(key: key);

  @override
  _DetailGroupContainerState createState() => _DetailGroupContainerState();
}

class _DetailGroupContainerState extends State<DetailGroupContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
