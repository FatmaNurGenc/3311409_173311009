import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/pages/home_page.dart';
import 'package:moddas_mobil_app_deneme/pages/register_page.dart';
import 'package:moddas_mobil_app_deneme/pages/splashScreen.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerSifre = new TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerSifre.dispose();

    super.dispose();
  }

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
              height: 500,
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
                  ), //BoxShadow
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
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 300,
                          child: InkWell(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/moddas.png"),
                                ),
                              ),
                              margin: const EdgeInsets.all(5.0),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          "VS 1.03.07",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            controller: _controllerEmail,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                labelText: "E-mail",
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
                            autofocus: false,
                            controller: _controllerSifre,
                            obscureText: true, //Şifre gizlendi
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: "Parola",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: signIn,
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 39, 81, 153),
                                      Colors.blue,
                                      Color.fromARGB(255, 90, 217, 240),
                                    ])),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Giriş',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onLongPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KayitOl()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 1,
                                width: 75,
                                color: Colors.lightBlueAccent,
                              ),
                              const Text(
                                "Kayıt ol",
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              Container(
                                height: 1,
                                width: 75,
                                color: Colors.lightBlueAccent,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Veritabanı: MD-SUREC",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 15,
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

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _controllerEmail.text.trim(),
            password: _controllerSifre.text.trim())
        .then((uid) => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => AnaSayfa())))
            });
  }
}
