import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    grafikCagir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Öncelik-Durum Grafiği",style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,
          color: Colors.red
          )),
          Container(
            height: 550,
            width: 400,
            child: grafikCagir(),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Color.fromARGB(255, 82, 40, 252),
                      ),
                      Text(" Beklemede")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.purple,
                      ),
                      Text(" Devam Ediyor")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.pink[300],
                      ),
                      Text(" Onay Bekliyor")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.pink[100],
                      ),
                      Text(" İptal Edildi")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Colors.teal[500],
                      ),
                      Text(" Tamamlandı")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Color.fromARGB(255, 1, 157, 168),
                      ),
                      Text(" Özel")
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

grafikCagir() {
  final List<ChartData> chartData = [
    ChartData('Normal', 2, 3, 4, 1, 1, 10),
    ChartData('Çok Yüksek', 1, 6, 4, 5, 5, 2),
    ChartData('Yüksek', 2, 1, 0, 0, 2, 1),
    ChartData('Acil', 3, 0, 0, 2, 3, 4),
    ChartData('Hata', 3, 3, 0, 0, 0, 1),
  ];
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <ChartSeries>[
      StackedColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData ch, _) => ch.x,
        yValueMapper: (ChartData ch, _) => ch.beklemede,
      ),
      StackedColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData ch, _) => ch.x,
        yValueMapper: (ChartData ch, _) => ch.devamEdiyor,
      ),
      StackedColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData ch, _) => ch.x,
        yValueMapper: (ChartData ch, _) => ch.onayBekliyor,
      ),
      StackedColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData ch, _) => ch.x,
        yValueMapper: (ChartData ch, _) => ch.iptalEdildi,
      ),
      StackedColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData ch, _) => ch.x,
        yValueMapper: (ChartData ch, _) => ch.tamamlandi,
      ),
      StackedColumnSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData ch, _) => ch.x,
        yValueMapper: (ChartData ch, _) => ch.ozel,
      ),
    ],
  );
}

class ChartData {
  final String x;
  final int beklemede;
  final int devamEdiyor;
  final int onayBekliyor;
  final int iptalEdildi;
  final int tamamlandi;
  final int ozel;
  ChartData(this.x, this.beklemede, this.devamEdiyor, this.onayBekliyor,
      this.iptalEdildi, this.tamamlandi, this.ozel);
}
