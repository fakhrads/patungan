import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

class GroupCardWidget extends StatelessWidget {
  const GroupCardWidget({
    Key? key,
    required this.grupTransaksi,
    required this.index,
  }) : super(key: key);

  final GrupTransaksi grupTransaksi;
  final int index;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.yMMMd().format(grupTransaksi.createdTime);

    return Card(
      child: Container(
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            Text(
              grupTransaksi.nama_grup,
            ),
          ],
        ),
      ),
    );
  }
}
