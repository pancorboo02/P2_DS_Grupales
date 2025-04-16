import 'package:ejercicio_grupal_2/class/LLMStrategy/llm_strategy.dart';
import '../../api_service.dart';

class ExpansionLLM implements LLMStrategy {
  @override
  String getIdModelo() {
    return "facebook/blenderbot-400M-distill";
  }

  @override
  String getNombre() {
    return "BlenderBot (Chat)";
  }

  @override
  Future<String> generarRespuesta(String message) async {
    return await HuggingFaceAPI.enviarSolicitud(getIdModelo(), message);
  }
}
