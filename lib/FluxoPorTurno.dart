// To parse this JSON data, do
//
//     final fluxoPorTurno = fluxoPorTurnoFromJson(jsonString);

import 'dart:convert';

List<FluxoPorTurno> fluxoPorTurnoFromJson(String str) =>
    List<FluxoPorTurno>.from(
        json.decode(str).map((x) => FluxoPorTurno.fromJson(x)));

String fluxoPorTurnoToJson(List<FluxoPorTurno> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FluxoPorTurno {
  FluxoPorTurno({
    required this.nomeTurno,
    required this.fluxo,
    required this.cor,
  });

  String nomeTurno;
  int fluxo;
  String cor;

  factory FluxoPorTurno.fromJson(Map<String, dynamic> json) => FluxoPorTurno(
        nomeTurno: json["nome_turno"],
        fluxo: json["fluxo"],
        cor: json["cor"],
      );

  Map<String, dynamic> toJson() => {
        "nome_turno": nomeTurno,
        "fluxo": fluxo,
        "cor": cor,
      };
}
