import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/model/pasien.dart';
import 'package:tugas_klinik_app/service/pasien_service.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'package:tugas_klinik_app/ui_pasien/pasien_form.dart';
import 'package:tugas_klinik_app/widget/sidebar.dart';
import 'package:tugas_klinik_app/ui_pasien/pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({Key? key}) : super(key: key);
  _PasienPageState createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  Stream<List<Pasien>> getList() async* {
    List<Pasien> data = await PasienService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: appPink,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasienForm(),
            ),
          );
        },
        child: const Icon(Icons.add_sharp),
      ),
      appBar: AppBar(
        title: const Text("Data Pasien"),
      ),
      body: StreamBuilder(
        stream: getList(),
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
            return Text("Data Kosong");
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return PasienItem(
                pasien: snapshot.data[index],
              );
            },
          );
        },
      ),
    );
  }
}
