import 'package:flutter/material.dart';

var kayitList = [
  "Deneme1",
  "Deneme2",
  "Deneme3",
  "Deneme4",
  "Deneme5",
];

class OrganizerList extends StatelessWidget {
  final islemAciklamasi;
  const OrganizerList({required this.islemAciklamasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
            itemCount: kayitList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialogFun(context, kayitList[index]);
                },
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text("$islemAciklamasi"),
                            Text(
                              kayitList[index],
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

showDialogFun(context, String kayitList) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 320,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    kayitList + 'Detay',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        ),
      );
    },
  );
}
