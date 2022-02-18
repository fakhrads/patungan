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
  List<Map<String, dynamic>> _values = [];
  var listOfFields = <Widget>[];

  late String nama_grup;
  late String catatan;

  @override
  void initState() {
    super.initState();

    nama_grup = widget.grupTransaksi?.nama_grup ?? '';
    catatan = widget.grupTransaksi?.catatan ?? '';
  }

  int _counter = 1;

  void addNewField() {
    setState(() {
      listOfFields.add(TextFormField());
    });
  }

  _onUpdate(int index, String val) async {
    int foundKey = -1;
    for (var map in _values) {
      if (map.containsKey("id")) {
        if (map["id"] == index) {
          foundKey = index;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": index,
      "value": val,
      "createdTime": DateTime.now(),
    };
    _values.add(json);
    for (Map m in _values) {
      print(m["value"]);
    }
  }

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

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: buildButton(),
      body: Form(
          key: _formKey,
          child: Center(
              child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                GroupFormWidget(
                  nama_grup: nama_grup,
                  catatan: catatan,
                  onChangedNamaGrup: (nama_grup) =>
                      setState(() => this.nama_grup = nama_grup),
                  onChangedCatatan: (catatan) =>
                      setState(() => this.catatan = catatan),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Row(children: [
                    Text("Anggota Grup"),
                    TextButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        child: Text("Add Member")),
                    TextButton(
                      onPressed: () {
                        _decrementCounter();
                      },
                      child: Text("-"),
                    )
                  ]),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: _counter,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return TextFormField(
                            onChanged: (val) {
                              _onUpdate(index, val);
                            },
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              hintText: 'Masukkan deskripsi',
                            ),
                          );
                        })),
              ]),
            ),
          ))));

  Widget buildButton() {
    final isFormValid = nama_grup.isNotEmpty && catatan.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: TextButton(
        onPressed: addOrUpdateGroup,
        child: Text('Simpan'),
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
          .push(MaterialPageRoute(builder: (context) => Home()));
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

    await SQLHelper.instance.create(grupTransaksi, _values);
  }
}
