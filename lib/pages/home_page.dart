import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:moddas_mobil_app_deneme/widgets/myDrawer.dart';

class AnaSayfa extends StatelessWidget {
  //final kullaniciAdi, sifre;
  //AnaSayfa({required this.kullaniciAdi, required this.sifre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: const Text("Ana Sayfa")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.5,
                image: AssetImage("assets/login.jpg"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.assessment_outlined,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "DASHBOARD",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.account_box,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "CARİ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CariMenu()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.receipt_long_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "FATURA/FİŞ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FaturaFis()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.checklist_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "SİPARİŞ YÖNETİMİ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SiparisYonetimMenu()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.yellow,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "STOK",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StokMenu()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              //decoration: BoxDecoration(color: Colors.blue[500]),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "ORGANİZER",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KayitBilgileri()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              //decoration: BoxDecoration(color: Colors.blue[500]),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "NOTLAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notlar()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //customBorder: StadiumBorder(),
                        //radius: 100,
                        splashColor: Colors.white70.withOpacity(0.9),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red,
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              //decoration: BoxDecoration(color: Colors.blue[500]),
                              margin: const EdgeInsets.all(10.0),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "ÇIKIŞ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                        ),
                        onDoubleTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'ÇIKIŞ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                  'Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(10)),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 18))),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Hayır'),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(10)),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 18))),
                                  onPressed: () {
                                    SystemNavigator
                                        .pop(); //Uygulamadan çıkış yapar
                                  },
                                  child: Text('Evet'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
          } else {
            return const LoginApp();
          }
        },
      ),
    );
  }
}
