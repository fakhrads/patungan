import 'package:flutter/material.dart';
import 'package:patungan/src/db/sql_helper.dart';
import 'package:patungan/src/components/edit_group/editGroup.dart';

class TestG extends StatefulWidget {
  const TestG({Key? key}) : super(key: key);

  @override
  _TestGState createState() => _TestGState();
}

class _TestGState extends State<TestG> {
  void _showForm(int? id_grup) async {
    if (id_grup != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id_grup'] == id_grup);
      _namaGrupController.text = existingJournal['nama_grup'];
      _catatanController.text = existingJournal['catatan'];
      // _namaPesertaController.text = existingJournal['nama_peserta'];
    }
  }

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter == 1) {
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getGrup();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _namaGrupController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();

  // grup
  // Insert a new journal to the database
  Future<void> _addGroup() async {
    await SQLHelper.createGroup(
      _namaGrupController.text,
      _catatanController.text,
    );
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateGroup(int id_grup) async {
    await SQLHelper.updateGrup(
        id_grup, _namaGrupController.text, _catatanController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteGroup(int id_grup) async {
    await SQLHelper.deleteGrup(id_grup);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: _journals.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(_journals[index]['nama_grup']),
          subtitle: Text(_journals[index]['catatan']),
          trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return editGroup();
                      }));
                      ;
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteGroup(_journals[index]['id_grup']),
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
