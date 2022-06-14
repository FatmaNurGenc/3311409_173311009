import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/model/load_data.dart';
import 'package:moddas_mobil_app_deneme/pages/organizer/organizer_kayit_bilgileri.dart';
import 'package:moddas_mobil_app_deneme/services/organizer_api.dart';
import 'package:intl/intl.dart';

class OrganizerListe extends StatefulWidget {
  const OrganizerListe({Key? key}) : super(key: key);

  @override
  State<OrganizerListe> createState() => _OrganizerListeState();
}

class _OrganizerListeState extends State<OrganizerListe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 226, 231, 241),
                Color.fromARGB(255, 127, 183, 228),
                Color.fromARGB(255, 212, 235, 239),
              ])),
          child: FutureBuilder(
            future: getRequest(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return listItem(
                        snapshot.data[index].id,
                        snapshot.data[index].konumu,
                        snapshot.data[index].gorusmeTarihi,
                        snapshot.data[index].firmaAdi,
                        snapshot.data[index].yetkilisi,
                        snapshot.data[index].telefon,
                        snapshot.data[index].grubu,
                        snapshot.data[index].aciklama,
                        snapshot.data[index].durumu,
                        snapshot.data[index].sorumluKullaniciId,
                        snapshot.data[index].pbCreateSubeId,
                        snapshot.data[index].pbUpdateSubeId,
                        snapshot.data[index].pbCreateUserId,
                        snapshot.data[index].pbUpdateUserId,
                        snapshot.data[index].altGrubu);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List months = [
    'OCA',
    'ŞUB',
    'MAR',
    'NİS',
    'MAY',
    'HAZ',
    'TEM',
    'AĞU',
    'EYL',
    'EKİ',
    'KAS',
    'ARA'
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Widget listItem(
    int id,
    String konumu,
    DateTime gorusmeTarihi,
    String firmaAdi,
    String yetkilisi,
    String telefon,
    String grubu,
    String aciklama,
    String durumu,
    int sorumluKullaniciId,
    int pbCreateSubeId,
    int pbUpdateSubeId,
    int pbCreateUserId,
    int pbUpdateUserId,
    String altGrubu,
  ) {
    int ay = gorusmeTarihi.month;
    return GestureDetector(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .43,
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "${gorusmeTarihi.day}",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(months[ay - 1]),
                        Text(
                          "${gorusmeTarihi.hour}:${gorusmeTarihi.minute}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 90,
                      padding: const EdgeInsets.all(5),
                      child: const VerticalDivider(
                        color: Colors.blue,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Konumu:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Durumu :",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Firma Adı :",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                //width: 20,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("$konumu"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("$durumu"),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            width: 150,
                            child: Text("$firmaAdi",
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTapUp: (TapUpDetails tapUpDetails) {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "İşlem Detayı",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const Divider(),
                        Column(
                          children: [
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Grubu :"),
                                Text("$grubu",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Alt Grubu :"),
                                Text("$altGrubu",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Konum :"),
                                Text("$konumu",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Durum/Öncelik :"),
                                Text("$durumu",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Firma Adı :"),
                                Text("$firmaAdi",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Yetkili :"),
                                Text("$yetkilisi",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Telefon :"),
                                Text("$telefon",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        const Text("İşlem Açıklaması :",
                            style: TextStyle(color: Colors.blue)),
                        Text("$aciklama"),
                        Container(
                          width: 500,
                          height: 50,
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.arrow_back_ios_new),
                            label: const Text(
                              "GERİ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 2.0,
                                color: Colors.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
