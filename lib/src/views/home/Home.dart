import 'package:flutter/material.dart';
import 'package:patungan/src/components/home/groupContainer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF00052D), body: GroupContainer());
  }
}
