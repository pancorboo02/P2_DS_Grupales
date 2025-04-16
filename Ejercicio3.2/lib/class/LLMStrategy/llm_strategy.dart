abstract class LLMStrategy {
  String getIdModelo();
  String getNombre();
  Future<String> generarRespuesta(String message);
}