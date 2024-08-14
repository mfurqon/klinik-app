import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'poli_detail.dart';
import '../model/poli.dart';
import '../service/poli_service.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({Key? key, required this.poli}) : super(key: key);
  _PoliUpdateFormState createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  final _jamBukaCtrl = TextEditingController();
  final _jamTutupCtrl = TextEditingController();

  Future<Poli> getData() async {
    Poli data = await PoliService().getById(
      widget.poli.id.toString(),
    );
    setState(
      () {
        _namaPoliCtrl.text = data.namaPoli;
        _jamBukaCtrl.text = data.jamBuka;
        _jamTutupCtrl.text = data.jamTutup;
      },
    );
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Poli"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              _fieldJamBuka(),
              _fieldJamTutup(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _fieldJamBuka() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jam Buka"),
      controller: _jamBukaCtrl,
      keyboardType: TextInputType.datetime,
    );
  }

  _fieldJamTutup() {
    return TextField(
      decoration: InputDecoration(labelText: "Jam Tutup"),
      controller: _jamTutupCtrl,
      keyboardType: TextInputType.datetime,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Poli poli = new Poli(
            namaPoli: _namaPoliCtrl.text,
            jamBuka: _jamBukaCtrl.text,
            jamTutup: _jamTutupCtrl.text);
        String id = widget.poli.id.toString();
        await PoliService().ubah(poli, id).then(
          (value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PoliDetail(poli: value),
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appPink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text("Simpan Perubahan"),
    );
  }
}
