import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/about/myabout.dart';
import 'package:tugas_klinik_app/ui_pasien/pasien_page.dart';
import 'package:tugas_klinik_app/ui_pegawai/pegawai_page.dart';
import 'package:tugas_klinik_app/ui_poli/poli_page.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
      ),
      drawer: Sidebar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Selamat Datang Di Klinik App",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 250,
            child: Text(
              "Aplikasi Klinik Kami Sudah dipercayai lebih dari 1 Juta Pengguna di Indonesia",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 60), backgroundColor: appPink),
                icon: Icon(Icons.accessible),
                label: Text("Poli"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoliPage(),
                    ),
                  );
                },
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 60), backgroundColor: appPink),
                icon: Icon(Icons.info_outline),
                label: const Text("Tentang"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAbout(),
                    ),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 60), backgroundColor: appPink),
                icon: Icon(Icons.people),
                label: Text("Pegawai"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PegawaiPage(),
                    ),
                  );
                },
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 60), backgroundColor: appPink),
                icon: Icon(Icons.account_box_sharp),
                label: Text("Pasien"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasienPage(),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
