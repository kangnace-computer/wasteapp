// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getCharData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(
        title: ChartTitle(text: 'กราฟแสดงการ ใช้งาน'),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          RadialBarSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
              maximumValue: 1000),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        focusColor: Colors.red,
        backgroundColor: Colors.red,
        onPressed: () {
          print('U cliek');
        },
        label: Text('Up date'),
        icon: Icon(Icons.file_download),
      ),
    );
  }

  List<GDPData> getCharData() {
    final List<GDPData> chartData = [
      GDPData('กระดาษ', 160),
      GDPData('ขวด', 240),
      GDPData('เหล็ก', 290),
      GDPData('ขวดพลาสติก', 230),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
