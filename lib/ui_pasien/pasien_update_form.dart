import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/service/pasien_service.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import '../model/pasien.dart';
import 'detail_pasien_page.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggalLahirPasienCtrl = TextEditingController();
  final _nomorTeleponPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  Future<Pasien> getData() async {
    Pasien data = await PasienService().getById(
      widget.pasien.id.toString(),
    );
    setState(
      () {
        _nomorRmCtrl.text = data.nomorRm;
        _namaPasienCtrl.text = data.nama;
        _tanggalLahirPasienCtrl.text = data.tanggalLahir;
        _nomorTeleponPasienCtrl.text = data.nomorTelepon;
        _alamatPasienCtrl.text = data.alamat;
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
        title: const Text("Ubah Data Pasien"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRm(),
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

  _fieldNomorRm() {
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
        String id = widget.pasien.id.toString();
        await PasienService().ubah(pasien, id).then(
          (value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPasienPage(pasien: value),
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
