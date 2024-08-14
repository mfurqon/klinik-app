import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/service/pasien_service.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'package:tugas_klinik_app/ui_pasien/pasien_page.dart';
import '../model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggalLahirPasienCtrl = TextEditingController();
  final _nomorTeleponPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRmPasien(),
              _fieldNamaPasien(),
              _fieldTanggalLahirPasien(),
              _fieldNomorTeleponPasien(),
              _fieldAlamatPasien(),
              SizedBox(height: 20),
              _simpanPasien(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNomorRmPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor RM"),
      controller: _nomorRmCtrl,
      keyboardType: TextInputType.number,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldTanggalLahirPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggalLahirPasienCtrl,
      keyboardType: TextInputType.datetime,
    );
  }

  _fieldNomorTeleponPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponPasienCtrl,
      keyboardType: TextInputType.phone,
    );
  }

  _fieldAlamatPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatPasienCtrl,
      keyboardType: TextInputType.streetAddress,
    );
  }

  _simpanPasien() {
    return ElevatedButton(
      onPressed: () async {
        Pasien pasien = new Pasien(
          nomorRm: _nomorRmCtrl.text,
          nama: _namaPasienCtrl.text,
          tanggalLahir: _tanggalLahirPasienCtrl.text,
          nomorTelepon: _nomorTeleponPasienCtrl.text,
          alamat: _alamatPasienCtrl.text,
        );
        await PasienService().simpan(pasien).then(
          (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PasienPage(),
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
