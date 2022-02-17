import 'package:flutter/material.dart';

class GroupFormWidget extends StatelessWidget {
  final String? nama_grup;
  final String? catatan;
  final ValueChanged<String> onChangedNamaGrup;
  final ValueChanged<String> onChangedCatatan;

  const GroupFormWidget({
    Key? key,
    this.nama_grup = '',
    this.catatan = '',
    required this.onChangedNamaGrup,
    required this.onChangedCatatan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNamaGrup(),
              SizedBox(height: 8),
              buildCatatan(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildNamaGrup() => TextFormField(
        initialValue: nama_grup,
        decoration: InputDecoration(
          hintText: 'Nama Grup',
        ),
        validator: (nama_grup) => nama_grup != null && nama_grup.isEmpty
            ? 'Group name cannot be empty'
            : null,
        onChanged: onChangedNamaGrup,
      );

  Widget buildCatatan() => TextFormField(
        initialValue: catatan,
        decoration: InputDecoration(
          hintText: 'Catatan',
        ),
        validator: (catatan) => catatan != null && catatan.isEmpty
            ? 'Description cannot be empty'
            : null,
        onChanged: onChangedCatatan,
      );
}
