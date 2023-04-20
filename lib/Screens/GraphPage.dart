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
              //Series Café
              barSeriesGraph(
                  groupName: "Cafe",
                  turno: "Café 6:50 - 7:20",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(27, 70, 250, 98)),
              barSeriesGraph(
                  groupName: "Cafe",
                  turno: "Café 7:20 - 7:50",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(59, 219, 188, 86)),
              barSeriesGraph(
                  groupName: "Cafe",
                  turno: "Café 7:50 - 8:40",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(118, 239, 64, 94)),
              //Series Almoço
              barSeriesGraph(
                  groupName: "Almoco",
                  turno: "Almoço 10:45 - 11:15",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(27, 70, 250, 98)),
              barSeriesGraph(
                  groupName: "Almoco",
                  turno: "Almoço 11:15 - 11:45",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(59, 219, 188, 86)),
              barSeriesGraph(
                  groupName: "Almoco",
                  turno: "Almoço 11:45 - 12:15",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(118, 239, 64, 94)),
              barSeriesGraph(
                  groupName: "Almoco",
                  turno: "Almoço 12:15 - 12:45",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(217, 186, 48, 85)),
              barSeriesGraph(
                  groupName: "Almoco",
                  turno: "Almoço 13:15 - 13:45",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(252, 130, 56, 99)),
              //Series Janta
              barSeriesGraph(
                  groupName: "Janta",
                  turno: "Janta 17:45 - 18:15",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(27, 70, 250, 98)),
              barSeriesGraph(
                  groupName: "Janta",
                  turno: "Janta 18:15 - 18:45",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(59, 219, 188, 86)),
              barSeriesGraph(
                  groupName: "Janta",
                  turno: "Janta 18:45 - 19:15",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(118, 239, 64, 94)),
              barSeriesGraph(
                  groupName: "Janta",
                  turno: "Janta 19:15 - 19:45",
                  dataSource: _chartData,
                  color: const Color.fromRGBO(217, 186, 48, 85)),
            ],
          ),
        ));
  }

  StackedColumnSeries<ChartData, String> barSeriesGraph(
      {required String groupName,
      required String turno,
      required var dataSource,
      required var color}) {
    return StackedColumnSeries<ChartData, String>(
      groupName: groupName,
      name: turno,
      dataSource: dataSource,
      color: color,
      xValueMapper: (ChartData data, _) => data.dayOfWeek,
      yValueMapper: (ChartData data, _) => data.fluxo_ru_mensal[turno],
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        labelAlignment: ChartDataLabelAlignment.middle,
        textStyle: TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }
}

List<ChartData> getChartData() {
  final chartData = [
    ChartData(
        dayOfWeek: 'Segunda',
        cafe: [15, 15, 10, 15],
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
  Map<String, int> fluxo_ru_mensal = Map();
  late List<int> almoco;
  late List<int> janta;

  ChartData(
      {required this.dayOfWeek,
      required this.cafe,
      required this.almoco,
      required this.janta}) {
    fluxo_ru_mensal["Café 6:50 - 7:20"] = cafe[0];
    fluxo_ru_mensal["Café 7:20 - 7:50"] = cafe[1];
    fluxo_ru_mensal["Café 7:50 - 8:40"] = cafe[2];

    fluxo_ru_mensal["Almoço 10:45 - 11:15"] = almoco[0];
    fluxo_ru_mensal["Almoço 11:15 - 11:45"] = almoco[1];
    fluxo_ru_mensal["Almoço 11:45 - 12:15"] = almoco[2];
    fluxo_ru_mensal["Almoço 12:15 - 12:45"] = almoco[3];
    fluxo_ru_mensal["Almoço 12:45 - 13:45"] = almoco[3];
    fluxo_ru_mensal["Almoço 13:15 - 13:45"] = almoco[3];

    fluxo_ru_mensal["Janta 17:45 - 18:15"] = janta[0];
    fluxo_ru_mensal["Janta 18:15 - 18:45"] = janta[1];
    fluxo_ru_mensal["Janta 18:45 - 19:15"] = janta[2];
    fluxo_ru_mensal["Janta 19:15 - 19:45"] = janta[3];
  }
}
