import 'package:flutter/material.dart';

class CariMenu extends StatefulWidget {
  const CariMenu({Key? key}) : super(key: key);

  @override
  State<CariMenu> createState() => _CariMenuState();
}

class _CariMenuState extends State<CariMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cari Menü")),
        body: Center(child: Text("Cari")));
  }
}
