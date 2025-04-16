import 'dart:convert';
import 'package:http/http.dart' as http;

class HuggingFaceAPI {
  static const String _token = "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";
  static const String _urlPeticiones = "https://api-inference.huggingface.co/models/";

  static Future<String> enviarSolicitud(String modeloId, String entrada) async {
    final respuesta = await http.post(
      Uri.parse("$_urlPeticiones$modeloId"),
      headers: {
        "Authorization": "Bearer $_token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"inputs": entrada}),
    );

    if (respuesta.statusCode == 200) {
      final decodificado = jsonDecode(respuesta.body);

      if (decodificado is List && decodificado.isNotEmpty) {
        if (decodificado[0].containsKey("summary_text")) {
          return decodificado[0]["summary_text"];
        } else if (decodificado[0].containsKey("generated_text")) {
          return decodificado[0]["generated_text"];
        } else {
          return "Respuesta no disponible";
        }
      } else {
        return "Respuesta vacía.";
      }
    } else {
      return "Error ${respuesta.statusCode}: ${respuesta.body}";
    }
  }
}

