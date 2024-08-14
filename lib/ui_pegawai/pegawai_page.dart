import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/model/pegawai.dart';
import 'package:tugas_klinik_app/service/pegawai_service.dart';
import 'package:tugas_klinik_app/theme/mycolor.dart';
import 'package:tugas_klinik_app/ui_pegawai/pegawai_form.dart';
import 'package:tugas_klinik_app/widget/sidebar.dart';
import 'package:tugas_klinik_app/ui_pegawai/pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({Key? key}) : super(key: key);
  _PegawaiPageState createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  Stream<List<Pegawai>> getList() async* {
    List<Pegawai> data = await PegawaiService().listData();
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
              builder: (context) => PegawaiForm(),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
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
              return PegawaiItem(
                pegawai: snapshot.data[index],
              );
            },
          );
        },
      ),
    );
  }
}
