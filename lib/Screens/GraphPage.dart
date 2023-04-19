import 'package:app_fluxo/NavigationDrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<StatefulWidget> createState() => _GraphPage();
}

class _GraphPage extends State<GraphPage> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Fluxo - RU2")),
        drawer: NavigationDrawerWidget(),
        body: Center(
          child: SfCartesianChart(
            title: ChartTitle(text: "Semanal"),
            primaryXAxis: CategoryAxis(),
            legend: Legend(isVisible: true),
            series: <ChartSeries>[
              StackedColumnSeries<ChartData, String>(
                groupName: 'Cafe',
                name: "Café 6:30 - 7:00",
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.dayOfWeek,
                yValueMapper: (ChartData data, _) => data.cafe[0],
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    showCumulativeValues: true,
                    textStyle: TextStyle(fontSize: 12, color: Colors.black)),
              ),
              StackedColumnSeries<ChartData, String>(
                groupName: 'Cafe',
                name: "Café 7:00 - 7:30",
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.dayOfWeek,
                yValueMapper: (ChartData data, _) => data.cafe[1],
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    showCumulativeValues: true,
                    textStyle: TextStyle(fontSize: 12, color: Colors.black)),
              ),
              StackedColumnSeries<ChartData, String>(
                groupName: 'Almoco',
                name: "Almoço 10:45 - 11:15",
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.dayOfWeek,
                yValueMapper: (ChartData data, _) => data.almoco[0],
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    showCumulativeValues: true,
                    textStyle: TextStyle(fontSize: 12, color: Colors.black)),
              ),
              StackedColumnSeries<ChartData, String>(
                groupName: 'Almoco',
                name: "Almoço 11:15 - 11:45",
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.dayOfWeek,
                yValueMapper: (ChartData data, _) => data.almoco[1],
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    showCumulativeValues: true,
                    textStyle: TextStyle(fontSize: 12, color: Colors.black)),
              ),
              StackedColumnSeries<ChartData, String>(
                groupName: 'Janta',
                name: "Janta 17:45 - 18:15",
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.dayOfWeek,
                yValueMapper: (ChartData data, _) => data.janta[0],
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    showCumulativeValues: true,
                    textStyle: TextStyle(fontSize: 12, color: Colors.black)),
              ),
              StackedColumnSeries<ChartData, String>(
                groupName: 'Janta',
                name: "Janta 18:15 - 18:45",
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.dayOfWeek,
                yValueMapper: (ChartData data, _) => data.janta[1],
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    showCumulativeValues: true,
                    textStyle: TextStyle(fontSize: 12, color: Colors.black)),
              ),
            ],
          ),
        ));
  }
}

List<ChartData> getChartData() {
  final chartData = [
    ChartData(
        dayOfWeek: 'Segunda',
        cafe: [20, 30, 10, 15],
        almoco: [10, 10, 10, 10],
        janta: [10, 10, 10, 10]),
    ChartData(
        dayOfWeek: 'Terça',
        cafe: [10, 40, 20, 20],
        almoco: [12, 10, 10, 10],
        janta: [14, 10, 10, 10]),
    ChartData(
        dayOfWeek: 'Quarta',
        cafe: [30, 10, 30, 18],
        almoco: [10, 10, 10, 10],
        janta: [8, 10, 10, 10]),
    ChartData(
        dayOfWeek: 'Quinta',
        cafe: [15, 25, 40, 19],
        almoco: [15, 10, 10, 10],
        janta: [10, 10, 10, 10]),
    ChartData(
        dayOfWeek: 'Sexta',
        cafe: [25, 20, 50, 40],
        almoco: [18, 10, 10, 10],
        janta: [13, 10, 10, 10]),
  ];
  return chartData;
}

class ChartData {
  final String dayOfWeek;
  late List<int> cafe;
  late List<int> almoco;
  late List<int> janta;

  ChartData({
    required this.dayOfWeek,
    required this.cafe,
    required this.almoco,
    required this.janta,
  });
}
