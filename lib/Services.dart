import 'package:http/http.dart' as http;
import 'FluxoPorTurnoDiario.dart';

class Services {
  Future<FluxoPorTurnoDiario> getFluxo(DateTime date) async {
    try {
      final response = await http.get(Uri.parse(
          'https://contagem.ceolin.org:8443/contagens/diario/8/${date.day}/${date.month}/${date.year}'));
      if (200 == response.statusCode) {
        // If the server did return a 200 OK response,
        final FluxoPorTurnoDiario data =
            FluxoPorTurnoDiario.fromJson(response.body, date);
        return data;
      } else {
        print('Erro: Response StatusCode: ${response.statusCode}');
        return FluxoPorTurnoDiario(
            nomeTurno: ["Not Found", "Not Found", "Not Found", "Not Found"],
            fluxo: [0, 0, 0, 0],
            cor: [],
            date: date);
      }
    } catch (e) {
      print(e);

      return FluxoPorTurnoDiario(
          nomeTurno: ["Not Found", "Not Found", "Not Found", "Not Found"],
          fluxo: [0, 0, 0, 0],
          cor: [],
          date: date);
    }
  }

  Future<List<FluxoPorTurnoDiario>> getFluxoMensal(DateTime date) async {
    List<FluxoPorTurnoDiario> fluxoMensal = [];

    DateTime auxDate = DateTime(date.year, date.month, 01);

    for (int day = 1; day <= 31; day++) {
      auxDate = DateTime(date.year, date.month, day);
      fluxoMensal.add(await Services().getFluxo(auxDate));
    }
    return fluxoMensal;
  }
}
