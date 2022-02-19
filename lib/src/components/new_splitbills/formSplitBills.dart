import 'package:flutter/material.dart';
import 'package:patungan/src/test/db/sqlHelper.dart';
import 'package:patungan/src/test/model/pesertaTransaksi.dart';
import 'package:patungan/src/test/model/splitBills.dart';
import 'package:patungan/src/views/match_splitbills/matchSplitBills.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';

class FormSplitBills extends StatefulWidget {
  final SplitBills? splitBills;
  final id;
  final namagrup;
  final deskripsi;
  FormSplitBills(
      {Key? key, this.splitBills, this.id, this.namagrup, this.deskripsi})
      : super(key: key);

  @override
  _FormSplitBillsState createState() => _FormSplitBillsState();
}

class _FormSplitBillsState extends State<FormSplitBills> {
  late List<PesertaTransaksi> tPes = [];
  var gTransaksi;
  final _DataItem = GlobalKey<FormState>();
  bool isLoading = false;
  int _counter = 1;

  @override
  void initState() {
    super.initState();

    refreshNotes();
    debugPrint("HEHE");
  }

  @override
  void dispose() {
    SQLHelper.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.tPes = await SQLHelper.instance.readPesertaTransaksi(widget.id);

    setState(() => isLoading = false);
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
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Group Name: ",
                                style: TextStyle(fontSize: 16)),
                            Text(widget.namagrup,
                                style: TextStyle(fontSize: 16))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date", style: TextStyle(fontSize: 16)),
                            Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now())
                                    .toString(),
                                style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
                    ))),
            Divider(
              color: Colors.white,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Note: ", style: TextStyle(fontSize: 16)),
                            Text(widget.deskripsi,
                                style: TextStyle(fontSize: 16))
                          ],
                        )
                      ],
                    ))),
            Divider(
              color: Colors.white,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Form(
                    key: _DataItem,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                // optional flex property if flex is 1 because the default flex is 1
                                flex: 1,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Jumlah Pajak',
                                      labelStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                // optional flex property if flex is 1 because the default flex is 1
                                flex: 1,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Diskon',
                                      labelStyle:
                                          TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                        ]))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(padding: const EdgeInsets.only(top: 90)),
                FlatButton(
                  onPressed: () {},
                  child: Text("Reset"),
                  color: Colors.grey.shade300,
                ),
                SizedBox(width: 15),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => matchSplitBills(),
                        ));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF2255DC),
                ),
              ],
            )
          ])),
        ));
  }
}

class FormSplit extends StatelessWidget {
  const FormSplit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            // optional flex property if flex is 1 because the default flex is 1
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Nama Item',
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            // optional flex property if flex is 1 because the default flex is 1
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Harga',
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
          ),
        ],
      )
    ]);
  }
}
