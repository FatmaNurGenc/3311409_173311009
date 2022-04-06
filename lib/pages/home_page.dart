import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/pages/organizer/organizer_kayit_bilgileri.dart';

class AnaSayfa extends StatelessWidget {
  final kullaniciAdi, sifre;
  const AnaSayfa({required this.kullaniciAdi, required this.sifre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa")),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 6, 40, 97),
              Colors.blue,
              Color.fromARGB(255, 55, 208, 235),
            ])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Text("Kullanıcı: $kullaniciAdi",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start),
            //Text("Şifre: $sifre"),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                SizedBox(
                  height: 170,
                  width: 170,
                  child: InkWell(
                    child: Container(
                        // width: 300,
                        // height: 500,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 48, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        //decoration: BoxDecoration(color: Colors.blue[500]),
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
                ),
                SizedBox(
                  height: 170,
                  width: 170,
                  child: InkWell(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 48, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        //decoration: BoxDecoration(color: Colors.blue[500]),
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
                              //textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    // onTap: () {
                    //   Navigator.push(
                    //       context, MaterialPageRoute(builder: (context) => Cari()));
                    // },
                  ),
                ),
                SizedBox(
                  height: 170,
                  width: 170,
                  child: InkWell(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 48, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                ),
                SizedBox(
                  height: 170,
                  width: 170,
                  child: InkWell(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 48, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                ),
                SizedBox(
                  height: 170,
                  width: 170,
                  child: InkWell(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 48, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                ),
                SizedBox(
                  height: 170,
                  width: 170,
                  child: InkWell(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 48, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KayitBilgileri()));
                    },
                  ),
                ),
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
