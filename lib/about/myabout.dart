import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'package:tugas_klinik_app/widget/sidebar.dart';

class MyAbout extends StatelessWidget {
  const MyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Tentang Kami"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // bagian ini tidak akan muncul namun
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/icon.png"),
              ),
            ),
          ),
          Container(
            child: Text(
              "Klinik App",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: appPink),
            ),
          ),
          Container(
            child: Text(
              "v1.0.0",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            child: Text("Powered by Flutter"),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Text("Created by Kelompok 4"),
          ),
          Container(
            child: Text("Credit :"),
          ),
          Container(
            child: Text("David Utomo - 15220362"),
          ),
          Container(
            child: Text("Fardha Hasykir - 15220284"),
          ),
          Container(
            child: Text("Rafi Kurniawan - 15220294"),
          ),
          Container(
            child: Text("Rizal Maulana - 15220372"),
          ),
          Container(
            child: Text("Rizky Ichsan Nur Rahman - 15220392"),
          ),
          Container(
            child: Text("Muhammad Furqon Prasetyo - 15220800"),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Text("Copyright 2023"),
          )
        ],
      ),
    );
  }
}
