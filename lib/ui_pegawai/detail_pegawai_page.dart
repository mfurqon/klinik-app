import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/model/pegawai.dart';
import 'package:tugas_klinik_app/service/pegawai_service.dart';
import 'package:tugas_klinik_app/ui_pegawai/pegawai_page.dart';
import 'pegawai_update_form.dart';

class DetailPegawaiPage extends StatefulWidget {
  final Pegawai pegawai;

  const DetailPegawaiPage({Key? key, required this.pegawai}) : super(key: key);
  _DetailPegawaiState createState() => _DetailPegawaiState();
}

class _DetailPegawaiState extends State<DetailPegawaiPage> {
  Stream<Pegawai> getData() async* {
    Pegawai data = await PegawaiService().getById(
      widget.pegawai.id.toString(),
    );
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pegawai"),
      ),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text("Data Tidak Ditemukan!");
          }
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "NIP : ${snapshot.data.nip}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Nama : ${snapshot.data.nama}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Tanggal Lahir : ${snapshot.data.tanggalLahir}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Nomor Telepon : ${snapshot.data.nomorTelepon}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Email : ${snapshot.data.email}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Password : ${snapshot.data.password}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ubahPegawai(),
                  _hapusPegawai(),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  _ubahPegawai() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiUpdateForm(pegawai: snapshot.data),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text("Ubah"),
      ),
    );
  }

  _hapusPegawai() {
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                onPressed: () async {
                  await PegawaiService().hapus(snapshot.data).then(
                    (value) {
                      Navigator.pop(context);
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
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Ya"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Tidak"),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text("Hapus"),
    );
  }
}
