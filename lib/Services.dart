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
            FluxoPorTurnoDiario.fromJson(response.body);
        return data;
      } else {
        print('Erro: Response StatusCode: ${response.statusCode}');
        return FluxoPorTurnoDiario(nomeTurno: [], fluxo: [], cor: []);
      }
    } catch (e) {
      print(e);

      return FluxoPorTurnoDiario(nomeTurno: [], fluxo: [], cor: []);
    }
  }
}
