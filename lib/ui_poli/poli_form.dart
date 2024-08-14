import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import '../model/poli.dart';
import 'poli_page.dart';
import '../service/poli_service.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  final _jamBukaCtrl = TextEditingController();
  final _jamTutupCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Poli"),
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
      decoration: const InputDecoration(labelText: "Jam Tutup"),
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
        await PoliService().simpan(poli).then(
          (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PoliPage(),
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
      child: const Text("Simpan"),
    );
  }
}
