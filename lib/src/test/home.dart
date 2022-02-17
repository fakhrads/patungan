// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:patungan/src/test/component/add/addGroup.dart';
// import 'package:patungan/src/test/view/groupList.dart';
// import 'package:patungan/src/db/sql_helper.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Patungan"),
//       ),
//       body: Container(
//           alignment: Alignment.topCenter,
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (BuildContext context) {
//                     return GroupList();
//                   }));
//                 },
//                 child: Text("List Group"),
//               ),
//               // ElevatedButton(
//               //   onPressed: () {
//               //     Navigator.push(context,
//               //         MaterialPageRoute(builder: (BuildContext context) {
//               //       return ListSplitBills();
//               //     }));
//               //   },
//               //   child: Text("List Split Bills"),
//               // ),
//             ],
//           )),
//     );
//   }
// }
