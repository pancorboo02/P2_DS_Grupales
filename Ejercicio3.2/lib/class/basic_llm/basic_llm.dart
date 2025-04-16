import 'package:ejercicio_grupal_2/api_service.dart';
import 'package:ejercicio_grupal_2/class/LLMStrategy/llm_strategy.dart';

class BasicLLM implements LLMStrategy {
  @override
  String getIdModelo() {
    return "facebook/bart-large-cnn";
  }

  @override
  String getNombre() {
    return "BART (Resumen)";
  }

  @override
  Future<String> generarRespuesta(String message) async {
    return await HuggingFaceAPI.enviarSolicitud(getIdModelo(), message);
  }
}
