import 'package:app_contagem/FluxoPorTurno.dart';
import 'package:flutter/material.dart';
import '../Services.dart';
import '../FluxoPorTurno.dart';

class DiarioPage extends StatefulWidget {
  const DiarioPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyDiarioPageState();
}

class _MyDiarioPageState extends State<DiarioPage> {
  late Future<List<FluxoPorTurno>> futurTurno;

  @override
  void initState() {
    super.initState();
    futurTurno = Services().getFluxo();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<List<FluxoPorTurno>>(
            future: futurTurno,
            builder: (context, turno) {
              if (turno.hasData) {
                return Text(
                    '${turno.data![0].nomeTurno} : ${turno.data![0].fluxo}');
              } else if (turno.hasError) {
                return Text('${turno.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }));
  }
}
