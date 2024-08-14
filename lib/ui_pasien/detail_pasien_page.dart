import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/model/pasien.dart';
import 'package:tugas_klinik_app/service/pasien_service.dart';
import 'package:tugas_klinik_app/ui_pasien/pasien_page.dart';
import 'pasien_update_form.dart';

class DetailPasienPage extends StatefulWidget {
  final Pasien pasien;

  const DetailPasienPage({Key? key, required this.pasien}) : super(key: key);
  _DetailPasienState createState() => _DetailPasienState();
}

class _DetailPasienState extends State<DetailPasienPage> {
  Stream<Pasien> getData() async* {
    Pasien data = await PasienService().getById(
      widget.pasien.id.toString(),
    );
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pasien"),
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
                "Nomor RM : ${snapshot.data.nomorRm}",
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
                "Alamat : ${snapshot.data.alamat}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ubahPasien(),
                  _hapusPasien(),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  _ubahPasien() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasienUpdateForm(pasien: snapshot.data),
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

  _hapusPasien() {
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
                  await PasienService().hapus(snapshot.data).then(
                    (value) {
                      Navigator.pop(context);
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
