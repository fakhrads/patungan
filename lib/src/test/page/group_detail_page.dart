import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';
import 'package:patungan/src/components/new_group/newGroupContainer.dart';

class GroupDetailPage extends StatefulWidget {
  final int groupId;

  const GroupDetailPage({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  @override
  _GroupDetailPageState createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  late GrupTransaksi grupTransaksi;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.grupTransaksi =
        await SQLHelper.instance.readGrupTransaksi(widget.groupId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      grupTransaksi.nama_grup,
                    ),
                    SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(grupTransaksi.createdTime),
                    ),
                    SizedBox(height: 8),
                    Text(
                      grupTransaksi.catatan,
                    ),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => newGroupContainer(grupTransaksi: grupTransaksi),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await SQLHelper.instance.delete(widget.groupId);

          Navigator.of(context).pop();
        },
      );
}
