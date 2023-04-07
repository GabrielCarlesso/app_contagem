import 'package:http/http.dart' as http;
import 'FluxoPorTurno.dart';

class Services {
  int dia = 6;

  Future<List<FluxoPorTurno>> getFluxo() async {
    try {
      final response = await http.get(Uri.parse(
          'https://contagem.ceolin.org:8443/contagens/diario/8/${dia}/10/2022'));
      if (200 == response.statusCode) {
        // If the server did return a 200 OK response,
        final List<FluxoPorTurno> data = fluxoPorTurnoFromJson(response.body);
        return data;
      } else {
        return List<FluxoPorTurno>.empty();
      }
    } catch (e) {
      return List<FluxoPorTurno>.empty();
    }
  }
}
