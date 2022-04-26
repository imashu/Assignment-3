import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Sales {
  String animal;
  int sales;
  Sales(this.animal, this.sales);
}

class _State extends State<MyApp> {
  List<Sales> _data = [];
  List<charts.Series<Sales, String>> _chartData = [];

  void _makeData() {
    _data = <Sales>[];
    _chartData = <charts.Series<Sales, String>>[];

    _data.add(Sales('Cats', 100));
    _data.add(Sales('Dogs', 300));
    _data.add(Sales('Birds', 50));
    _data.add(Sales('Lizards', 25));

    _chartData.add(charts.Series(
        id: 'Sales',
        data: _data,
        colorFn: (Sales sales, _) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.animal,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales'));
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 3'),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const Text('Pet Sales'),
                Expanded(child: charts.BarChart(_chartData))
              ],
            ),
          )),
    );
  }
}
