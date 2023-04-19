import 'package:flutter/material.dart';
import '../Services.dart';
import '../FluxoPorTurnoDiario.dart';

class DiarioPage extends StatefulWidget {
  const DiarioPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyDiarioPageState();
}

class _MyDiarioPageState extends State<DiarioPage> {
  DateTime _day = DateTime.now();

  late Future<FluxoPorTurnoDiario> futureTurno;

  @override
  void initState() {
    super.initState();
    futureTurno = Services().getFluxo(_day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Diario")),
        body: Column(children: [
          Row(children: [
            Text(_day.toString()),
            IconButton(
                icon: Icon(Icons.date_range),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2025),
                  ).then((value) {
                    setState(() {
                      _day = value!;
                      futureTurno = Services().getFluxo(_day);
                    });
                  });
                }),
          ]),
          FutureBuilder<FluxoPorTurnoDiario>(
              future: futureTurno,
              builder: (context, turno) {
                if (turno.hasData) {
                  return Text(
                      '${turno.data!.nomeTurno} : ${turno.data!.fluxo}');
                } else if (turno.hasError) {
                  return Text('${turno.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              })
        ]));
  }
}
