import 'package:flutter/material.dart';

class CariMenu extends StatelessWidget {
  const CariMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cari Menü")),
      body: Column(
        children: [TextButton(onPressed: deneme(), child: Text("tıkla"))],
      ),
    );
  }
}

deneme() {}
