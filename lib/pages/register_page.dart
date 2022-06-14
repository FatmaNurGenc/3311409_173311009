import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/model/user_model.dart';
import 'package:moddas_mobil_app_deneme/pages/home_page.dart';
import 'package:moddas_mobil_app_deneme/pages/login_page.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  TextEditingController _controllerKullaniciAdi = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerSifre = new TextEditingController();
  TextEditingController _controllerSifreTekrar = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage("assets/mavi_arkaplan.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              width: 325,
              height: 570,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Stack(
                clipBehavior: Clip
                    .none, // ikonun, arkadaki containerin üzerinde görünmesini sağlıyor
                children: <Widget>[
                  Positioned(
                    top: -35,
                    left: 130,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/moddas_icon.png'),
                          //fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.centerLeft,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.blue,
                                size: 35,
                              )),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginApp()));
                          },
                        ),
                        const Text(
                          "Kayıt Ol",
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey[200],
                          ),
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextField(
                            controller: _controllerKullaniciAdi,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "Kullanıcı Adı",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextField(
                            controller: _controllerEmail,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                labelText: "E-Mail",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextFormField(
                            controller: _controllerSifre,
                            obscureText: true, //Şifre gizlendi
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: "Şifre",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextFormField(
                            controller: _controllerSifreTekrar,
                            obscureText: true, //Şifre gizlendi
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: "Şifre Tekrar",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_controllerSifre.text != null &&
                                _controllerEmail.text != null) {
                              if (_controllerSifre.text ==
                                  _controllerSifreTekrar.text) {
                                signUp(_controllerEmail.text,
                                    _controllerSifre.text);
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Tekrar deneyiniz"),
                              ));
                            }

                            if (_controllerSifre.text ==
                                _controllerSifreTekrar.text) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _controllerEmail.text,
                                      password: _controllerSifre.text)
                                  .then((value) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginApp()));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Başarıyla kaydedildi!"),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Hatalı şifre tekrarı! Tekrar deneyiniz."),
                              ));
                            }
                          },
                          child: Container(
                            width: 260,
                            height: 40,
                            //padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 39, 81, 153),
                                      Colors.blue,
                                      Color.fromARGB(255, 90, 217, 240),
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),

                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                "Kaydet",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      );

  void signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _controllerEmail.text.trim(),
            password: _controllerSifre.text.trim())
        .then((value) => {postDetailsToFirestore()});
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.kullaniciadi = _controllerKullaniciAdi.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => AnaSayfa()), (route) => false);
  }
}
