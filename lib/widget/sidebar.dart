import 'package:flutter/material.dart';
import 'package:tugas_klinik_app/about/myabout.dart';
import 'beranda.dart';
import 'login.dart';
import '../ui_poli/poli_page.dart';
import '../ui_pasien/pasien_page.dart';
import '../ui_pegawai/pegawai_page.dart';
import '../theme/model_theme.dart';
import '../theme/mycolor.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ModelTheme>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: appPink,
            ),
            accountEmail: Text("admin@gmail.com"),
            accountName: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[500],
                    child: Icon(
                      color: appPink,
                      Icons.person,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("admin"),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text("Poli"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Pasien"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(themeNotifier.isDark
                ? Icons.nightlight_round_sharp
                : Icons.wb_sunny),
            title: Text(themeNotifier.isDark ? "Mode Gelap" : "Mode Terang"),
            onTap: () {
              themeNotifier.isDark = !themeNotifier.isDark;
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("Tentang Kami"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAbout(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
