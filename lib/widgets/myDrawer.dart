import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moddas_mobil_app_deneme/pages/cari/cari_menu.dart';
import 'package:moddas_mobil_app_deneme/pages/dashboard/dashboard.dart';
import 'package:moddas_mobil_app_deneme/pages/fatura_fis/fatura_fis.dart';
import 'package:moddas_mobil_app_deneme/pages/login_page.dart';
import 'package:moddas_mobil_app_deneme/pages/notlar/notlar.dart';
import 'package:moddas_mobil_app_deneme/pages/organizer/organizer_kayit_bilgileri.dart';
import 'package:moddas_mobil_app_deneme/pages/siparis_yonetimi/siparis_yonetim.dart';
import 'package:moddas_mobil_app_deneme/pages/stok/stok.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(192, 78, 164, 230),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      "assets/beyaz_moddas.png",
                    ))),
            decoration: const BoxDecoration(
              color: Color.fromARGB(192, 78, 164, 230),
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: const Text(
              "Giriş",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assessment_outlined),
            title: Text(
              'Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(
              'Cari',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CariMenu()));
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long_rounded),
            title: Text(
              'Fatura/Fiş',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FaturaFis()));
            },
          ),
          ListTile(
            leading: Icon(Icons.checklist_rounded),
            title: Text(
              'Sipariş Yönetimi',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SiparisYonetimMenu()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text(
              'Stok',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StokMenu()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text(
              'Organizer',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KayitBilgileri()));
            },
          ),
          ListTile(
            leading: Icon(Icons.menu_book_rounded),
            title: Text(
              'Notlar',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            //trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Notlar()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red[800],
            ),
            title: Text(
              'Çıkış',
              style: TextStyle(color: Colors.red[800], fontSize: 18),
            ),
            // trailing: Icon(Icons.arrow_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'ÇIKIŞ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                      'Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
                  actions: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Hayır'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      onPressed: () {
                        SystemNavigator.pop(); //Uygulamadan çıkış yapar
                      },
                      child: Text('Evet'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
