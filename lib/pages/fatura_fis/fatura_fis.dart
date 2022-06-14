import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/services/organizer_api.dart';

class FaturaFis extends StatefulWidget {
  const FaturaFis({Key? key}) : super(key: key);

  @override
  State<FaturaFis> createState() => _FaturaFisState();
}

class _FaturaFisState extends State<FaturaFis> {
   Offset offset = Offset.zero;
  final transController = TransformationController();
  late TapDownDetails doubleTapDetails;

  handleDoubleTapDown(TapDownDetails details) {
    doubleTapDetails = details;
  }

  handleDoubleTap() {
    if (transController.value != Matrix4.identity()) {
      transController.value = Matrix4.identity();
    } else {
      final position = doubleTapDetails.localPosition;
      transController.value = Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cari Menü")),
        body: Column(
          children: [
            SizedBox(height: 50,child: Center(child: Text("Fatura Örneği:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),),
            Container(
              height: 600,
              width: 400,
              child: Stack(
                children: [
                  Positioned(
                      left: offset.dx,
                      top: offset.dy,
                      child: GestureDetector(
                        
                        child: InteractiveViewer(
                          transformationController: transController,
                          child: Image.asset(
                            "assets/fatura.jpg",
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        onPanUpdate: (details) {
                          setState(() {
                            offset = Offset(offset.dx + details.delta.dx,
                                offset.dy + details.delta.dy);
                          });
                        },
                        onDoubleTap: handleDoubleTap,
                        onDoubleTapDown: handleDoubleTapDown,
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
