import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          children: [Text("Patungan"), Text("-By banteng-")],
        ),
      ),
    ));
  }
}
