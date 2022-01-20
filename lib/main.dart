import 'dart:async';
import 'package:flutter/material.dart';
import './src/screens/group_list/index.dart';
import './src/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SplashScreen()));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5EBF0),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(33.0), // here the desired height
          child: AppBar(
            title: Text(
              'Patungan',
              style: TextStyle(fontFamily: 'Lobster'),
            ),
            backgroundColor: Color(0xFF122E76),
          )),
      body: GroupList(),
    );
  }
}
