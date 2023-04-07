import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PageMonthlyGraph extends StatefulWidget {
  const PageMonthlyGraph({super.key});

  @override
  State<StatefulWidget> createState() => _MyPageMonthlyGraph();
}

class _MyPageMonthlyGraph extends State<PageMonthlyGraph> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SfCartesianChart(
        title: ChartTitle(text: "Titulo"),
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          StackedColumnSeries<ChartData, String>(
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.dayOfWeek,
            yValueMapper: (ChartData data, _) => data.manha,
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.middle,
                showCumulativeValues: true,
                textStyle: TextStyle(fontSize: 12, color: Colors.black)),
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.dayOfWeek,
            yValueMapper: (ChartData data, _) => data.meioDia,
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.middle,
                showCumulativeValues: true),
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.dayOfWeek,
            yValueMapper: (ChartData data, _) => data.tarde,
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.middle,
                showCumulativeValues: true),
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.dayOfWeek,
            yValueMapper: (ChartData data, _) => data.noite,
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.middle,
                showCumulativeValues: true),
          ),
        ],
      ),
    ));
  }
}

List<ChartData> getChartData() {
  final chartData = [
    ChartData('Segunda', 20, 30, 10, 15),
    ChartData('Terça', 10, 40, 20, 20),
    ChartData('Quarta', 30, 10, 30, 18),
    ChartData('Quinta', 15, 25, 40, 19),
    ChartData('Sexta', 25, 20, 50, 40),
  ];
  return chartData;
}

class ChartData {
  final String dayOfWeek;
  final double manha;
  final double meioDia;
  final double tarde;
  final double noite;

  ChartData(this.dayOfWeek, this.manha, this.meioDia, this.tarde, this.noite);
}
