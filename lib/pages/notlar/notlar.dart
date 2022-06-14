import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Notlar extends StatefulWidget {
  const Notlar({Key? key}) : super(key: key);

  @override
  State<Notlar> createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {
  //dosyaYolunu oluşturulması
  Future<String> get getDosyaYolu async {
    Directory dosya = await getApplicationDocumentsDirectory();
    return dosya.path;
  }

  //Dosyanın oluşturulması
  Future get dosyaOlustur async {
    var dosyakonumu = await getDosyaYolu;
    return File(dosyakonumu + "/olusturulandosya.txt");
  }

  //dosyaya yazma işlemi
  Future dosyaYaz(String dosyaninIcerigi) async {
    var myDosya = await dosyaOlustur;

    return myDosya.writeAsString(dosyaninIcerigi);
  }

  //dosyayı okuma
  Future<String> okunacakDosya() async {
    var myDosya = await dosyaOlustur;

    String dosyaicerigi = myDosya.readAsStringSync();
    return dosyaicerigi;
  }

  //Form Field'dan Input alabilmemiz için controller yapısı
  TextEditingController mycontroller = TextEditingController();

  //Dosyaya yazılan veriyi ekranda gösterebilmek için gerekli degişken
  var gosterilecekDeger = "";

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notlar"),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.3,
                      image: AssetImage("assets/notlarkitap.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          color: Colors.white,
                          child: TextField(
                            controller: mycontroller,
                            maxLines: 3,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Not girişi",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _Yaz,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[300]),
                        child: const Text(
                          "Notu Kaydet",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _Oku,
                        child: const Text("Kayıtlı Notu Oku",
                            style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "$gosterilecekDeger",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }

  void _Yaz() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Not başarıyla kaydedildi!"),
    ));
    dosyaYaz(mycontroller.text.toString()).then((value) {
      setState(() {
        gosterilecekDeger = " ";
      });
    });
  }

  void _Oku() async {
    okunacakDosya().then((String deger) {
      setState(() {
        gosterilecekDeger = deger;
        debugPrint("$gosterilecekDeger");
      });
    });
  }
}
