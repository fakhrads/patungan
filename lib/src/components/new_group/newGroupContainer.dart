import 'package:flutter/material.dart';
import 'package:patungan/src/views/home/Home.dart';
import 'package:patungan/src/test/testG.dart';
// import '../../db/sql_helper.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/widget/group_form_widget.dart';
import 'package:patungan/src/test/model/grupTransaksi.dart';

class newGroupContainer extends StatefulWidget {
  final GrupTransaksi? grupTransaksi;

  const newGroupContainer({
    Key? key,
    this.grupTransaksi,
  }) : super(key: key);

  @override
  _newGroupContainerState createState() => _newGroupContainerState();
}

class _newGroupContainerState extends State<newGroupContainer> {
  final _formKey = GlobalKey<FormState>();
  late String nama_grup;
  late String catatan;

  // Future<int> _createGroup(String nama_grup, String? catatan) async {
  //   int data;
  //   SQLHelper sql = new SQLHelper();
  //   return await SQLHelper.createGroup(nama_grup, catatan);
  // }

  // void _showForm(int? id_grup) async {
  //   if (id_grup != null) {
  //     // id == null -> create new item
  //     // id != null -> update an existing item
  //     final existingJournal =
  //         _journals.firstWhere((element) => element['id_grup'] == id_grup);
  //     _namaGrupController.text = existingJournal['nama_grup'];
  //     _catatanController.text = existingJournal['catatan'];
  //     _namaPesertaController.text = existingJournal['nama_peserta'];
  //   }
  // }

  @override
  void initState() {
    super.initState();

    nama_grup = widget.grupTransaksi?.nama_grup ?? '';
    catatan = widget.grupTransaksi?.catatan ?? '';
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
  // final TextEditingController _namaPesertaController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      // // final buffer = _showForm();

      // int? id_grup;

      // if (id_grup != null) {
      //   // id == null -> create new item
      //   // id != null -> update an existing item
      //   final existingJournal =
      //       _journals.firstWhere((element) => element['id_grup'] == id_grup);
      //   _namaGrupController.text = existingJournal['nama_grup'];
      //   _catatanController.text = existingJournal['catatan'];
      //   _namaPesertaController.text = existingJournal['nama_peserta'];
      // }

      Scaffold(
        body: Form(
          key: _formKey,
          child: GroupFormWidget(
            nama_grup: nama_grup,
            catatan: catatan,
            onChangedNamaGrup: (nama_grup) =>
                setState(() => this.nama_grup = nama_grup),
            onChangedCatatan: (catatan) =>
                setState(() => this.catatan = catatan),
          ),
        ),
        floatingActionButton: buildButton(),
      );

  Widget buildButton() {
    final isFormValid = nama_grup.isNotEmpty && catatan.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        onPressed: addOrUpdateGroup,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateGroup() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.grupTransaksi != null;

      if (isUpdating) {
        await updateGroup();
      } else {
        await addGroup();
      }

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TestG()));
    }
  }

  Future updateGroup() async {
    final grupTransaksi = widget.grupTransaksi!.copy(
      nama_grup: nama_grup,
      catatan: catatan,
    );

    await SQLHelper.instance.update(grupTransaksi);
  }

  Future addGroup() async {
    final grupTransaksi = GrupTransaksi(
      nama_grup: nama_grup,
      catatan: catatan,
      createdTime: DateTime.now(),
    );

    await SQLHelper.instance.create(grupTransaksi);
  }

  // // grup
  // // Insert a new journal to the database
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

  // // peserta
  // // Insert a new journal to the database
  // Future<void> _addGroup() async {
  //   await SQLHelper.createGroup(
  //     _namaGrupController.text,
  //     _catatanController.text,
  //   );
  //   _refreshJournals();
  // }
}
