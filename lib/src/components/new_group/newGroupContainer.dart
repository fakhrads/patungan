import 'package:flutter/material.dart';
import 'package:patungan/src/views/home/Home.dart';
import '../../db/sql_helper.dart';

class newGroupContainer extends StatefulWidget {
  const newGroupContainer({Key? key}) : super(key: key);

  @override
  _newGroupContainerState createState() => _newGroupContainerState();
}

class _newGroupContainerState extends State<newGroupContainer> {
  Future<int> _createGroup(String nama_grup, String? catatan) async {
    int data;
    SQLHelper sql = new SQLHelper();
    return await SQLHelper.createGroup(nama_grup, catatan);
  }

  void _showForm(int? idGrup) async {
    if (idGrup != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['idGrup'] == idGrup);
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
  // final TextEditingController _namaPesertaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final buffer = _showForm();

    int? id_grup;

    if (id_grup != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id_grup'] == id_grup);
      _namaGrupController.text = existingJournal['nama_grup'];
      _catatanController.text = existingJournal['catatan'];
    }

    return Center(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Group'),
                      TextField(
                        controller: _namaGrupController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Nama Group',
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Text('Deskripsi Group'),
                      TextField(
                        controller: _catatanController,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          hintText: 'Masukkan deskripsi',
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Row(children: [
                        Text('Member'),
                        TextButton(
                          child: Text('Add Column'),
                          onPressed: () => _incrementCounter(),
                        ),
                        TextButton(
                          child: Text(
                            'Delete Column',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () => _decrementCounter(),
                        ),
                      ]),
                      Expanded(
                          child: ListView.builder(
                              itemCount: _counter,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return new TextField(
                                  cursorHeight: 20,
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan deskripsi',
                                  ),
                                );
                              })),
                      TextButton(
                        child: Text(
                          'Simpan',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () async {
                          // _createGroup(
                          //   _namaGrupController.text,
                          //   _catatanController.text,
                          // );

                          // Save new journal
                          if (id_grup == null) {
                            await _addGroup();
                          }

                          if (id_grup != null) {
                            await _updateGroup(id_grup);
                          }

                          // Clear the text fields
                          _namaGrupController.text = '';
                          _catatanController.text = '';

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                    ],
                  ),
                ))));
  }

  // Insert a new journal to the database
  Future<void> _addGroup() async {
    await SQLHelper.createGroup(
        _namaGrupController.text, _catatanController.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateGroup(int id_grup) async {
    await SQLHelper.updateGrup(
        id_grup, _namaGrupController.text, _catatanController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id_grup) async {
    await SQLHelper.deleteGrup(id_grup);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }
}
