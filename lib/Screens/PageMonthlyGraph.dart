import 'package:app_contagem/FluxoPorTurnoDiario.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Services.dart';

class PageMonthlyGraph extends StatefulWidget {
  const PageMonthlyGraph({super.key});

  @override
  State<StatefulWidget> createState() => _MyPageMonthlyGraph();
}

class _MyPageMonthlyGraph extends State<PageMonthlyGraph> {
  late Future<List<FluxoPorTurnoDiario>> fluxoMensal;

  late List<ChartData> _chartData = [];

  @override
  void initState() {
    fluxoMensal = Services().getFluxoMensal(DateTime.parse('2022-10-02'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fluxoMensal,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _chartData = getChartData(snapshot.data!);
            return Center(
              child: SfCartesianChart(
                title: ChartTitle(text: "Titulo"),
                legend: Legend(isVisible: true),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  StackedColumnSeries<ChartData, String>(
                    name: "Manhã",
                    dataSource: _chartData,
                    xValueMapper: (ChartData data, _) => data.dayOfWeek,
                    yValueMapper: (ChartData data, _) => data.manha,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelAlignment: ChartDataLabelAlignment.middle,
                        showCumulativeValues: true,
                        textStyle:
                            TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                  StackedColumnSeries<ChartData, String>(
                    name: "Meio Dia",
                    dataSource: _chartData,
                    xValueMapper: (ChartData data, _) => data.dayOfWeek,
                    yValueMapper: (ChartData data, _) => data.meioDia,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelAlignment: ChartDataLabelAlignment.middle,
                        showCumulativeValues: true),
                  ),
                  StackedColumnSeries<ChartData, String>(
                    name: "Tarde",
                    dataSource: _chartData,
                    xValueMapper: (ChartData data, _) => data.dayOfWeek,
                    yValueMapper: (ChartData data, _) => data.tarde,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        labelAlignment: ChartDataLabelAlignment.middle,
                        showCumulativeValues: true),
                  ),
                  StackedColumnSeries<ChartData, String>(
                    name: "Noite",
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
            );
          } else {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        });
  }
}

List<ChartData> getChartData(List<FluxoPorTurnoDiario> fluxoMensal) {
  final chartData = [
    ChartData('Segunda', fluxoMensal[6].fluxo[0], fluxoMensal[6].fluxo[1],
        fluxoMensal[6].fluxo[2], fluxoMensal[6].fluxo[3]),
    ChartData('Terça', fluxoMensal[7].fluxo[0], fluxoMensal[7].fluxo[1],
        fluxoMensal[7].fluxo[2], fluxoMensal[7].fluxo[3]),
    ChartData('Quarta', fluxoMensal[8].fluxo[0], fluxoMensal[8].fluxo[1],
        fluxoMensal[8].fluxo[2], fluxoMensal[8].fluxo[3]),
    ChartData('Quinta', fluxoMensal[9].fluxo[0], fluxoMensal[9].fluxo[1],
        fluxoMensal[9].fluxo[2], fluxoMensal[9].fluxo[3]),
    ChartData('Sexta', fluxoMensal[10].fluxo[0], fluxoMensal[10].fluxo[1],
        fluxoMensal[10].fluxo[2], fluxoMensal[10].fluxo[3]),
  ];
  return chartData;
}

class ChartData {
  final String dayOfWeek;
  final int manha;
  final int meioDia;
  final int tarde;
  final int noite;

  ChartData(this.dayOfWeek, this.manha, this.meioDia, this.tarde, this.noite);
}
