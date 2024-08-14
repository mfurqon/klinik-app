import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/service/pegawai_service.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import '../model/pegawai.dart';
import 'detail_pegawai_page.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _noTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(
      widget.pegawai.id.toString(),
    );
    setState(
      () {
        _nipCtrl.text = data.nip;
        _namaPegawaiCtrl.text = data.nama;
        _tanggalLahirCtrl.text = data.tanggalLahir;
        _noTeleponCtrl.text = data.nomorTelepon;
        _emailCtrl.text = data.email;
        _passwordCtrl.text = data.password;
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
        title: const Text("Ubah Data Pegawai"),
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
      decoration: InputDecoration(labelText: "Nomor Telepon"),
      controller: _noTeleponCtrl,
      keyboardType: TextInputType.phone,
    );
  }

  _fieldEmailPegawai() {
    return TextField(
      decoration: InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
    );
  }

  _fieldPasswordPegawai() {
    return TextField(
      decoration: InputDecoration(labelText: "Password"),
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
        String id = widget.pegawai.id.toString();
        await PegawaiService().ubah(pegawai, id).then(
          (value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPegawaiPage(pegawai: value),
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
