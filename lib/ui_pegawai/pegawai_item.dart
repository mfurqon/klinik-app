import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'detail_pegawai_page.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;

  const PegawaiItem({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(pegawai.nama),
          subtitle: Text(pegawai.nip),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPegawaiPage(pegawai: pegawai),
          ),
        );
      },
    );
  }
}
