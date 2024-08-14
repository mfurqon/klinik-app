import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/service/pegawai_service.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'package:tugas_klinik_app/ui_pegawai/pegawai_page.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _noTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNipPegawai(),
              _fieldNamaPegawai(),
              _fieldTanggalLahir(),
              _fieldNomorTelepon(),
              _fieldEmailPegawai(),
              _fieldPasswordPegawai(),
              SizedBox(height: 20),
              _simpanPegawai(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNipPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP Pegawai"),
      controller: _nipCtrl,
      keyboardType: TextInputType.number,
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldTanggalLahir() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
      keyboardType: TextInputType.datetime,
    );
  }

  _fieldNomorTelepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _noTeleponCtrl,
      keyboardType: TextInputType.phone,
    );
  }

  _fieldEmailPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
    );
  }

  _fieldPasswordPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
      obscureText: true,
    );
  }

  _simpanPegawai() {
    return ElevatedButton(
      onPressed: () async {
        Pegawai pegawai = new Pegawai(
          nip: _nipCtrl.text,
          nama: _namaPegawaiCtrl.text,
          tanggalLahir: _tanggalLahirCtrl.text,
          nomorTelepon: _noTeleponCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );
        await PegawaiService().simpan(pegawai).then(
          (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PegawaiPage(),
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
