import 'package:flutter/material.dart';
// import 'package:patungan/src/db/sql_helper.dart';
// import 'package:patungan/src/components/edit_group/editGroup.dart';

import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:patungan/src/test/widget/group_card_widget.dart';
import 'package:patungan/src/test/page/group_detail_page.dart';

class TestG extends StatefulWidget {
  @override
  _TestGState createState() => _TestGState();
}

class _TestGState extends State<TestG> {
  late List<GrupTransaksi> gTransaksi;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    SQLHelper.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.gTransaksi = await SQLHelper.instance.readAllGrupTransaksi();

    setState(() => isLoading = false);
  }

  // void _showForm(int? id_grup) async {
  //   if (id_grup != null) {
  //     // id == null -> create new item
  //     // id != null -> update an existing item
  //     final existingJournal =
  //         _journals.firstWhere((element) => element['id_grup'] == id_grup);
  //     _namaGrupController.text = existingJournal['nama_grup'];
  //     _catatanController.text = existingJournal['catatan'];
  //     // _namaPesertaController.text = existingJournal['nama_peserta'];
  //   }
  // }

  // int _counter = 1;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrementCounter() {
  //   if (_counter == 1) {
  //   } else {
  //     setState(() {
  //       _counter--;
  //     });
  //   }
  // }

  // List<Map<String, dynamic>> _journals = [];

  // bool _isLoading = true;

  // // This function is used to fetch all data from the database
  // void _refreshJournals() async {
  //   final data = await SQLHelper.getGrup();
  //   setState(() {
  //     _journals = data;
  //     _isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _refreshJournals(); // Loading the diary when the app starts
  // }

  // final TextEditingController _namaGrupController = TextEditingController();
  // final TextEditingController _catatanController = TextEditingController();

  // grup
  // Insert a new journal to the database
  // Future<void> _addGroup() async {
  //   await SQLHelper.createGroup(
  //     _namaGrupController.text,
  //     _catatanController.text,
  //   );
  //   _refreshJournals();
  // }

  // // Update an existing journal
  // Future<void> _updateGroup(int id_grup) async {
  //   await SQLHelper.updateGrup(
  //       id_grup, _namaGrupController.text, _catatanController.text);
  //   _refreshJournals();
  // }

  // // Delete an item
  // void _deleteGroup(int id_grup) async {
  //   await SQLHelper.deleteGrup(id_grup);
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     content: Text('Successfully deleted a journal!'),
  //   ));
  //   _refreshJournals();
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: buildGroup(),
      ));

  Widget buildGroup() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: gTransaksi.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final grupTransaksi = gTransaksi[index]; // yg ini errornya

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    GroupDetailPage(groupId: grupTransaksi.id_grup!),
              ));

              refreshNotes();
            },
            child: GroupCardWidget(grupTransaksi: grupTransaksi, index: index),
          );
        },
      );
}
