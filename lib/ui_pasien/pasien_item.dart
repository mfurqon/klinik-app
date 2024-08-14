import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'detail_pasien_page.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;

  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(pasien.nama),
          subtitle: Text(pasien.nomorRm),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPasienPage(pasien: pasien),
          ),
        );
      },
    );
  }
}
