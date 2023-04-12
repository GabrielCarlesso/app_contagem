import 'dart:convert';

class FluxoPorTurnoDiario {
  final DateTime date;
  final List<String> nomeTurno;
  final List<int> fluxo;
  final List<String> cor;

  FluxoPorTurnoDiario(
      {required this.nomeTurno,
      required this.fluxo,
      required this.cor,
      required this.date});

  factory FluxoPorTurnoDiario.fromJson(String jsonData, DateTime day) {
    var objJson = json.decode(jsonData);
    List<String> listaTurno = [];
    List<int> listaFluxo = [];
    List<String> listaCor = [];

    for (var elemento in objJson) {
      listaTurno.add(elemento["nome_turno"]);
      listaFluxo.add(elemento["fluxo"]);
      listaCor.add(elemento["cor"]);
    }

    return FluxoPorTurnoDiario(
      nomeTurno: listaTurno,
      fluxo: listaFluxo,
      cor: listaCor,
      date: day,
    );
  }
}
